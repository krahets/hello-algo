/* Original ink is the visual source. Geometry supplies depth, never a new palette. */
import * as T from './vendor/three/three.module.min.js';

export function texture(image) {
  const result = new T.Texture(image);
  result.colorSpace = T.SRGBColorSpace;
  result.needsUpdate = true;
  return result;
}

export function loadImage(url) {
  return new Promise((resolve, reject) => {
    const image = new Image();
    image.onload = () => resolve(image);
    image.onerror = () => reject(new Error(`Unable to load hero art: ${url}`));
    image.src = url;
  });
}

const vertex = `varying vec2 artUV; varying vec3 objectPoint; varying vec3 viewNormal;
  void main(){artUV=uv;objectPoint=position;viewNormal=normalize(normalMatrix*normal);
  gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}`;

// Rest-view camera projection. The original's baked ink lighting is intentional:
// relighting it as a PBR material would double-shade and wash out its cream lines.
export function paintedMaterial(image, repair, kind = 0) {
  return new T.ShaderMaterial({
    side:T.DoubleSide, transparent:true, depthWrite:true,
    uniforms:{art:{value:texture(image)},repair:{value:texture(repair || image)},kind:{value:kind},emphasis:{value:0}},
    vertexShader:vertex,
    fragmentShader:`varying vec2 artUV;uniform sampler2D art;uniform sampler2D repair;
      uniform float kind;uniform float emphasis;
      void main(){vec2 uv=artUV;vec4 c=texture2D(art,uv);
        if(kind==1.){
          // Restrict the generated repair to the empty palm; every other original
          // texel, including helmet, folds, gloves and boots, stays untouched.
          float hand=(1.-smoothstep(.22,.27,uv.x))*smoothstep(.425,.445,uv.y)*(1.-smoothstep(.55,.57,uv.y));
          c=mix(c,texture2D(repair,uv),hand);
        }
        if(kind==2.){
          // Keep original orbit strokes and rocks. Only the internal cutout is filled.
          vec2 p=(uv-vec2(.49,.58))/vec2(.34,.32);
          float fill=1.-smoothstep(.92,1.02,length(p));
          vec4 restored=texture2D(repair,uv);
          c=mix(c,restored,fill*(1.-c.a));
        }
        if(c.a<.04)discard;c.rgb*=1.+emphasis*.055;gl_FragColor=c;
        #include <colorspace_fragment>
      }`,
  });
}

// A depth surface, not a billboard. x/y and UV never move at the reference view.
// Depth is inferred from the illustrated helmet, chest, knees, gloves and boots.
// This representation is deliberately limited to small camera excursions.
export function createRelief(image, repair, kind) {
  const w=image.naturalWidth,h=image.naturalHeight;
  const g=new T.PlaneGeometry(w,h,128,128);
  const positions=g.attributes.position;
  const dome=(u,v,x,y,rx,ry,z)=>z*Math.sqrt(Math.max(0,1-((u-x)/rx)**2-((v-y)/ry)**2));
  for(let i=0;i<positions.count;i++){
    const u=positions.getX(i)/w+.5,v=.5-positions.getY(i)/h;
    let z;
    if(kind===1){
      z=Math.max(dome(u,v,.635,.16,.225,.17,.19),dome(u,v,.64,.43,.21,.24,.13),
        dome(u,v,.30,.64,.21,.14,.16),dome(u,v,.72,.73,.23,.14,.13),
        dome(u,v,.81,.62,.14,.18,.17),dome(u,v,.64,.90,.16,.16,.20),
        dome(u,v,.13,.51,.15,.07,.12),dome(u,v,.32,.44,.20,.10,.10));
      z=(z+.025)*h;
    }else{
      // One continuous tilted disc; orbit brush strokes share the same plane.
      z=(v-.5)*h*1.75;
    }
    positions.setZ(i,z);
  }
  positions.needsUpdate=true;g.computeVertexNormals();
  const mesh=new T.Mesh(g,paintedMaterial(image,repair,kind));
  mesh.userData.representation=kind===1?'painted-depth-surface':'painted-disc';
  return mesh;
}

// Measurements in original PNG pixels. Rings and satellites keep their original
// projected silhouettes instead of sharing a generic Saturn template.
export const planetDefinitions = [
  {name:'array_and_linkedlist',circle:[237,166,130],period:160,axis:.62,ring:[237,166,277,51,.59,176]},
  {name:'stack_and_queue',period:155,axis:.12},
  {name:'hashing',period:145,axis:.72},
  {name:'tree',period:180,axis:-.28},
  {name:'heap',period:150,axis:-.60},
  {name:'graph',circle:[270,136,135],period:185,axis:.24,ring:[270,136,280,9,.27,146]},
  {name:'searching',period:165,axis:-.24},
  {name:'sorting',period:155,axis:.5},
  {name:'divide_and_conquer',circle:[156,130,117],period:200,axis:.61,ring:[203,134,240,60,.58,164],moon:[307,50,33]},
  {name:'backtracking',circle:[166,115,115],period:175,axis:-.13,ring:[173,159,173,70,-.08,126]},
  {name:'dynamic_programming',period:170,axis:.48},
  {name:'greedy',circle:[135,85,83],period:180,axis:-.60,ring:[133,101,149,61,-.57,111]},
];

export function createPaintedPlanet(image, definition) {
  const w=image.naturalWidth,h=image.naturalHeight,root=new T.Group();
  const art=texture(image),circle=definition.circle || [w/2,h/2,Math.min(w,h)/2];
  const [cx,cy,r]=circle,ring=definition.ring;
  const material=new T.ShaderMaterial({
    uniforms:{art:{value:art},size:{value:new T.Vector2(w,h)},circle:{value:new T.Vector3(cx,cy,r)},
      ring:{value:new T.Vector4(...(ring?[ring[0],ring[1],ring[2],ring[3]]:[0,0,1,1]))},
      ringAngle:{value:ring?ring[4]:0},inner:{value:ring?ring[5]:0},hasRing:{value:ring?1:0},emphasis:{value:0}},
    vertexShader:vertex,
    fragmentShader:`varying vec3 objectPoint;varying vec3 viewNormal;uniform sampler2D art;uniform vec2 size;uniform vec3 circle;
      uniform vec4 ring;uniform float ringAngle;uniform float inner;uniform float hasRing;uniform float emphasis;
      vec4 paintAt(vec2 projected){vec2 pixel=circle.xy+vec2(projected.x,-projected.y)*circle.z*.992;
        if(hasRing>0.){
          vec2 q=vec2(pixel.x-ring.x,ring.y-pixel.y);
          float a=q.x*cos(ringAngle)+q.y*sin(ringAngle);
          float b=-q.x*sin(ringAngle)+q.y*cos(ringAngle);
          float rr=length(vec2(a,b*ring.z/ring.w));
          // The front annulus occludes this part of the reference photograph.
          // Extend adjacent ink under it; don't rotate a baked ring on the sphere.
          if(b<0. && rr>inner-3. && rr<ring.z+3.){
            pixel-=vec2(sin(ringAngle),cos(ringAngle))*(-b+12.);
          }
        }
        vec2 delta=pixel-circle.xy;
        pixel=circle.xy+delta*min(1.,circle.z*.992/max(length(delta),.01));
        vec2 uv=vec2(pixel.x/size.x,1.-pixel.y/size.y);vec4 ink=texture2D(art,uv);
        for(int i=0;i<4;i++){if(ink.a<.8){pixel=mix(circle.xy,pixel,.90);ink=texture2D(art,vec2(pixel.x/size.x,1.-pixel.y/size.y));}}
        return ink;
      }
      void main(){vec3 p=normalize(objectPoint);
        vec4 ink=paintAt(p.xy);
        gl_FragColor=vec4(ink.rgb*(1.+emphasis*.055),1.);
        #include <colorspace_fragment>
      }`,
  });
  const sphere=new T.Mesh(new T.SphereGeometry(1,64,40),material);
  sphere.position.set(cx-w/2,h/2-cy,0);sphere.scale.setScalar(r);root.add(sphere);
  if(ring){
    const [x,y,outer,minor,angle,inner]=ring;
    // Deproject the actual painted annulus onto its inclined plane. A perfect
    // analytic ellipse clipped the irregular original brushwork at both tips.
    const geometry=new T.PlaneGeometry(w,h);
    const pos=geometry.attributes.position;
    for(let i=0;i<pos.count;i++){
      const qx=pos.getX(i)+w/2-x,qy=pos.getY(i)-h/2+y;
      const minorCoordinate=-qx*Math.sin(angle)+qy*Math.cos(angle);
      pos.setZ(i,-minorCoordinate*Math.sqrt((outer/minor)**2-1));
    }
    geometry.computeVertexNormals();
    const ringMaterial=new T.ShaderMaterial({transparent:true,side:T.DoubleSide,
      uniforms:{art:{value:art},size:{value:new T.Vector2(w,h)},circle:{value:new T.Vector3(cx,cy,r)},
        ring:{value:new T.Vector4(x,y,outer,minor)},angle:{value:angle},inner:{value:inner},
        moon:{value:new T.Vector3(...(definition.moon||[-1000,-1000,0]))}},vertexShader:vertex,
      fragmentShader:`varying vec2 artUV;uniform sampler2D art;uniform vec2 size;uniform vec3 circle;
        uniform vec4 ring;uniform vec3 moon;uniform float angle;uniform float inner;
        void main(){vec2 pixel=vec2(artUV.x,1.-artUV.y)*size;
          if(distance(pixel,moon.xy)<moon.z)discard;
          vec2 q=vec2(pixel.x-ring.x,ring.y-pixel.y);
          float a=q.x*cos(angle)+q.y*sin(angle),b=-q.x*sin(angle)+q.y*cos(angle);
          float rr=length(vec2(a,b*ring.z/ring.w));
          if(distance(pixel,circle.xy)<circle.z && (b>=0.||rr<inner-8.||rr>ring.z+8.))discard;
          vec4 c=texture2D(art,artUV);if(c.a<.04)discard;gl_FragColor=c;
          #include <colorspace_fragment>
        }`});
    root.add(new T.Mesh(geometry,ringMaterial));
  }
  if(definition.moon){
    const [x,y,radius]=definition.moon,moonMaterial=material.clone();
    moonMaterial.uniforms.circle.value=new T.Vector3(x,y,radius);moonMaterial.uniforms.hasRing.value=0;
    const moon=new T.Mesh(new T.SphereGeometry(1,32,24),moonMaterial);
    moon.position.set(x-w/2,h/2-y,80);moon.scale.setScalar(radius);root.add(moon);
  }
  return {root,sphere,material,axis:new T.Vector3(-Math.sin(definition.axis),Math.cos(definition.axis),0)};
}

export function createPaintedHourglass(image) {
  const root=new T.Group(),frame=new T.Group();root.add(frame);
  const points=[[-.42,0],[-.415,.15],[-.385,.255],[-.35,.26],[-.27,.23],[-.18,.17],[-.08,.08],
    [0,.018],[.08,.08],[.18,.17],[.27,.23],[.35,.26],[.385,.255],[.415,.15],[.42,0]];
  const geometry=new T.LatheGeometry(points.map(([y,r])=>new T.Vector2(r,y)),64);
  const position=geometry.attributes.position,uv=geometry.attributes.uv;
  for(let i=0;i<position.count;i++)uv.setXY(i,position.getX(i)/.533+.5,position.getY(i)/.84+.5);
  const material=new T.ShaderMaterial({
    side:T.DoubleSide,transparent:true,
    uniforms:{art:{value:texture(image)},progress:{value:0},parity:{value:1}},vertexShader:vertex,
    fragmentShader:`varying vec2 artUV;varying vec3 objectPoint;uniform sampler2D art;uniform float progress;uniform float parity;
      void main(){vec4 ink=texture2D(art,artUV);if(ink.a<.05)discard;
        float x=objectPoint.x,y=objectPoint.y*parity;
        float upper=.29*pow(1.-progress,1./3.);float lower=.29*pow(progress,1./3.);
        float lowTop=-.31+lower*(1.-abs(x)/max(lower*.64,.001));
        bool top=y>0. && y<upper && abs(x)<y*.61;
        bool bottom=y>-.31 && y<lowTop && abs(x)<.19;
        // Retain the painted glass highlights; animate the sand inside the bulbs.
        if((top||bottom) && ink.b<.32 && ink.r<.45){
          ink.rgb=mix(ink.rgb,vec3(.06,.14,.15),.16);
          if(abs(y-upper)<.007||abs(y-lowTop)<.009)ink.rgb=vec3(.78,.74,.43);
        }
        if(progress<.999 && y<0. && y>lowTop && abs(x)<.0035)ink.rgb=vec3(.85,.79,.47);
        gl_FragColor=ink;
        #include <colorspace_fragment>
      }`,
  });
  frame.add(new T.Mesh(geometry,material));
  function update(time){
    const phase=time%14,cycle=Math.floor(time/14),flip=T.MathUtils.smoothstep(phase,11.6,13.2);
    frame.rotation.z=(cycle+flip)*Math.PI;
    // A symmetric two-bulb reference can use the same painted surface each cycle.
    material.uniforms.progress.value=Math.min(phase/11,1);
    material.uniforms.parity.value=cycle%2?-1:1;
    root.position.y=.42+Math.sin(flip*Math.PI)*.10;
  }
  update(0);return {root,update};
}
