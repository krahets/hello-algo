/* Reference-led painted sphere maps and antialiased three-dimensional rings. */
import * as T from './vendor/three/three.module.min.js';

// Palette order: deep ink, secondary pigment, body, accent, paper highlight.
// Shapes describe the original illustration's visual vocabulary, not its pixels.
export const planets = [
  {name:'array_and_linkedlist',texture:'array_and_linkedlist-albedo.webp',period:76,tilt:.59,colors:['#554f6d','#99748b','#d9bd83','#f3dca0','#fff0bd'],circle:[237,166,130],ring:[237,166,277,51,176],ringStyle:0},
  {name:'stack_and_queue',texture:'stack_and_queue-albedo.webp',period:69,tilt:-.12,colors:['#263f56','#438c97','#e4b044','#4fa4a4','#f6ce64']},
  {name:'hashing',texture:'hashing-albedo.webp',period:63,tilt:-.72,colors:['#294459','#a56870','#4a9e9b','#efad48','#f8d687']},
  {name:'tree',texture:'tree-albedo.webp',period:83,tilt:.28,colors:['#264458','#aa866e','#188e84','#cfcc94','#f1d99b']},
  {name:'heap',texture:'heap-albedo.webp',period:55,tilt:.60,colors:['#273e52','#ad7c99','#b4c67e','#ddab98','#e9d8a0']},
  {name:'graph',texture:'graph-albedo.webp',period:89,tilt:.27,colors:['#464464','#786587','#be8d9d','#e3a493','#f2ce9b'],circle:[270,136,135],ring:[270,136,280,9,146],ringStyle:1},
  {name:'searching',texture:'searching-albedo.webp',period:58,tilt:.24,colors:['#4b526d','#a7788a','#63a5a0','#a6b28c','#eddb9e']},
  {name:'sorting',texture:'sorting-albedo.webp',period:52,tilt:-.5,colors:['#3e3d57','#b57191','#eaa9ae','#f6df98','#fff0b5']},
  {name:'divide_and_conquer',texture:'divide_and_conquer-albedo.webp',period:94,tilt:.58,colors:['#494a63','#b6777e','#e5a129','#f3c45c','#ffe6a1'],circle:[156,130,117],ring:[203,134,240,60,164],ringStyle:2,moon:[307,50,33],moonTexture:'moon-albedo.webp'},
  {name:'backtracking',texture:'backtracking-albedo.webp',period:81,tilt:-.08,colors:['#36475c','#727887','#eead30','#c58c4d','#f7d27b'],circle:[166,115,115],ring:[173,159,173,70,126],ringStyle:3},
  {name:'dynamic_programming',texture:'dynamic_programming-albedo.webp',period:67,tilt:-.48,colors:['#36394f','#8c4b6d','#d36959','#ed9d46','#f5cb6e']},
  {name:'greedy',texture:'greedy-albedo.webp',period:72,tilt:-.57,colors:['#234c60','#32878d','#72b1a7','#b9bd84','#e8ba66'],circle:[135,85,83],ring:[133,101,149,61,111],ringStyle:4},
];

const vertex=`varying vec3 p;varying vec3 n;
  void main(){p=position;n=normalize(normalMatrix*normal);
  gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}`;
async function loadMap(file) {
  const map=await new T.TextureLoader().loadAsync(new URL('./hero-textures/'+file,import.meta.url).href);
  map.colorSpace=T.SRGBColorSpace;map.wrapS=T.RepeatWrapping;
  map.minFilter=T.LinearMipmapLinearFilter;map.magFilter=T.LinearFilter;map.anisotropy=4;
  return map;
}

export async function loadPlanetPaint(definition) {
  const surface=await loadMap(definition.texture);
  try {
    return {surface,moon:definition.moonTexture?await loadMap(definition.moonTexture):null};
  } catch(error) {surface.dispose();throw error;}
}

export function disposePlanetPaint(paint) {
  paint?.surface.dispose();paint?.moon?.dispose();
}

function surface(definition,paintMap) {
  return new T.ShaderMaterial({uniforms:{pigments:{value:definition.colors.map(c=>new T.Color(c))},paintMap:{value:paintMap},emphasis:{value:0}},vertexShader:vertex,
    fragmentShader:`varying vec3 p;varying vec3 n;uniform vec3 pigments[5];uniform float emphasis;uniform sampler2D paintMap;
    void main(){vec3 q=normalize(p);
      // Periodic paint overlap across the unseen meridian. Keep longitude monotonic
      // so painted strokes flow around the globe without mirrored side folds.
      float u=atan(q.x,q.z)/6.28318530718+.5;
      float y=asin(clamp(q.y,-1.,1.))/3.14159265359+.5;
      float x=.1+.8*u;
      // Explicit angular derivatives keep mip selection continuous at atan's wrap.
      float denom=6.28318530718*max(dot(q.xz,q.xz),.0001);
      vec2 gradX=vec2(.8*(q.z*dFdx(q.x)-q.x*dFdx(q.z))/denom,dFdx(y));
      vec2 gradY=vec2(.8*(q.z*dFdy(q.x)-q.x*dFdy(q.z))/denom,dFdy(y));
      vec3 ink=textureGrad(paintMap,vec2(x,y),gradX,gradY).rgb;
      if(u<.12)ink=mix(textureGrad(paintMap,vec2(x+.8,y),gradX,gradY).rgb,ink,smoothstep(-.12,.12,u));
      if(u>.88)ink=mix(ink,textureGrad(paintMap,vec2(x-.8,y),gradX,gradY).rgb,smoothstep(.88,1.12,u));
      // Fixed, restrained illumination preserves the illustration's pigment values.
      vec3 normal=normalize(n);float light=dot(normal,normalize(vec3(-.60,.80,1.2)));
      float shade=.72+.28*smoothstep(-.10,.86,light);
      vec3 color=ink*shade;
      float rim=1.-smoothstep(.015,.10,normal.z);
      color=mix(color,pigments[4],rim*.18);
      color*=1.+emphasis*.09;
      gl_FragColor=vec4(color,1.);
      #include <colorspace_fragment>
    }`});
}

export function createPlanet(image,d,paint) {
  const w=image.naturalWidth,h=image.naturalHeight,[cx,cy,r]=d.circle||[w/2,h/2,Math.min(w,h)/2];
  const root=new T.Group(),axis=new T.Group(),sphere=new T.Mesh(new T.SphereGeometry(1,64,40),surface(d,paint.surface));
  axis.rotation.z=d.tilt*.15;axis.rotation.x=.08;axis.position.set(cx-w/2,h/2-cy,0);
  sphere.scale.setScalar(r);axis.add(sphere);root.add(axis);
  if(d.ring){
    const [x,y,outer,minor,inner]=d.ring;
    const ring=new T.Mesh(new T.RingGeometry(inner,outer,256),new T.ShaderMaterial({side:T.DoubleSide,transparent:true,depthWrite:false,
      uniforms:{inner:{value:inner},outer:{value:outer},style:{value:d.ringStyle},ink:{value:new T.Color(d.ringStyle===2?'#c3d3a7':d.ringStyle===4?'#6bb5ae':d.colors[d.ringStyle===1?2:4])},dark:{value:new T.Color(d.ringStyle===0?'#bca178':d.ringStyle===2?'#986e63':d.ringStyle===4?'#d49861':d.colors[1])}},vertexShader:vertex,
      fragmentShader:`varying vec3 p;uniform float inner;uniform float outer;uniform float style;uniform vec3 ink;uniform vec3 dark;
        // Integrate a stroke over its pixel footprint. Unresolved rings become faint
        // continuous coverage, rather than hard discard dots that shimmer in motion.
        float stroke(float t,float center,float halfWidth,float pixel){
          return clamp((t-center+halfWidth)/pixel+.5,0.,1.)-clamp((t-center-halfWidth)/pixel+.5,0.,1.);
        }
        void main(){float t=(length(p.xy)-inner)/(outer-inner);
          float pixel=max(fwidth(t),.0005);float alpha=1.;
          vec3 color=ink;
          if(style==0.){
            // Broad cream ring: a small number of painterly layers, not a sine comb.
            color=mix(ink,dark,.22*stroke(t,.18,.06,pixel));
            color=mix(color,dark,.18*stroke(t,.45,.025,pixel));
            color=mix(color,dark,.12*stroke(t,.66,.04,pixel));
            color=mix(color,dark,.30*stroke(t,.90,.015,pixel));
            alpha=1.-.82*stroke(t,.77,.018,pixel);
          }else if(style==1.){
            color=mix(dark,ink,.45+.35*smoothstep(.15,.85,t));
          }else{
            float first=stroke(t,.12,.027,pixel),middle=stroke(t,.46,.020,pixel),last=stroke(t,.86,.024,pixel);
            alpha=max(first,max(middle,last));
            // The reference has teal/sage inner sweeps and a sparse warm outer arc.
            float arc=smoothstep(-.1,.35,p.x/outer)*smoothstep(-.2,.3,-p.y/outer);
            color=mix(ink,dark,style==4.?arc*last:style==2.?.35*last:.55*first);
            if(style==3.)color=mix(dark,ink,smoothstep(-.2,.4,p.x/outer));
          }
          alpha*=smoothstep(0.,pixel,t)*(1.-smoothstep(1.-pixel,1.,t));
          if(alpha<.001)discard;
          color*=.90+.10*smoothstep(-outer*.4,outer*.4,p.y);
          gl_FragColor=vec4(color,alpha);
          #include <colorspace_fragment>
        }`}));
    ring.rotation.set(Math.acos(minor/outer),0,d.tilt,'ZXY');
    ring.position.set(x-w/2,h/2-y,0);root.add(ring);
  }
  let moon=null;
  if(d.moon){
    const [x,y,radius]=d.moon;moon=new T.Mesh(new T.SphereGeometry(radius,32,24),surface({...d,colors:['#35475a','#b77c94','#659e98','#d9bb87','#eed6ac']},paint.moon));
    moon.position.set(x-w/2,h/2-y,80);root.add(moon);
  }
  return {root,sphere,moon,material:sphere.material};
}
