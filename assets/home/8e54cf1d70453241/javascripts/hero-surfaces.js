import { textureCatalog } from './hero-assets.js';
import { paintSeams } from './hero-paint-seams.js';
/* Reference-led painted sphere maps and antialiased three-dimensional rings. */
import * as T from './vendor/three/three.module.min.js';

// Palette order: deep ink, secondary pigment, body, accent, paper highlight.
// tilt sets the shared polar axis. belt traces a reference latitude in the paint
// (top-down y at 9 evenly spaced x positions); beltLevel is its target latitude.
// Monotone UV rectification aligns the painted flow over the entire revolution.
// Shapes describe the original illustration's visual vocabulary, not its pixels.
export const planets = [
  {name:'array_and_linkedlist',paintWindow:[.1,.62],period:76,tilt:0.59,beltLevel:0.5,belt:[0.5,0.5175,0.59,0.63,0.63,0.58,0.55,0.5025,0.5],colors:['#554f6d','#99748b','#d9bd83','#f3dca0','#fff0bd'],circle:[237,166,130],ring:[237,166,277,51,176],ringStyle:0},
  {name:'stack_and_queue',period:69,tilt:0.12,beltLevel:0.5,belt:[0.5,0.52,0.6,0.59,0.56,0.5,0.43,0.47,0.5],colors:['#263f56','#438c97','#e4b044','#4fa4a4','#f6ce64']},
  {name:'hashing',paintWindow:[.04,.96],period:63,tilt:0.69,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#294459','#a56870','#4a9e9b','#efad48','#f8d687']},
  {name:'tree',period:83,tilt:0.28,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#264458','#aa866e','#188e84','#cfcc94','#f1d99b']},
  {name:'heap',period:55,tilt:-0.55,beltLevel:0.5,belt:[0.5,0.4625,0.47,0.57,0.67,0.75,0.65,0.5,0.5],colors:['#273e52','#ad7c99','#b4c67e','#ddab98','#e9d8a0']},
  {name:'graph',period:89,tilt:0.27,beltLevel:0.5,belt:[0.5,0.535,0.61,0.58,0.54,0.5,0.47,0.485,0.5],colors:['#464464','#786587','#be8d9d','#e3a493','#f2ce9b'],circle:[270,136,135],ring:[270,136,280,9,146],ringStyle:1},
  {name:'searching',period:58,tilt:0.12,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#4b526d','#a7788a','#63a5a0','#a6b28c','#eddb9e']},
  {name:'sorting',period:52,tilt:-0.5,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#3e3d57','#b57191','#eaa9ae','#f6df98','#fff0b5']},
  {name:'divide_and_conquer',period:94,tilt:0.58,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#494a63','#b6777e','#e5a129','#f3c45c','#ffe6a1'],circle:[156,130,117],ring:[203,134,240,60,164],ringStyle:2,moon:[307,50,33]},
  {name:'backtracking',period:81,tilt:-0.08,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#36475c','#727887','#eead30','#c58c4d','#f7d27b'],circle:[166,115,115],ring:[173,159,173,70,126],ringStyle:3},
  {name:'dynamic_programming',period:67,tilt:0.2,beltLevel:0.5,belt:[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5],colors:['#36394f','#8c4b6d','#d36959','#ed9d46','#f5cb6e']},
  {name:'greedy',period:72,tilt:-0.57,beltLevel:0.5,belt:[0.5,0.4825,0.51,0.62,0.67,0.67,0.61,0.51,0.5],colors:['#234c60','#32878d','#72b1a7','#b9bd84','#e8ba66'],circle:[135,85,83],ring:[133,101,149,61,111],ringStyle:4},
];

const vertex=`varying vec3 p;varying vec3 n;
  void main(){p=position;n=normalize(normalMatrix*normal);
  gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}`;
async function loadMap(file) {
  const map=await new T.TextureLoader().loadAsync(new URL(file,import.meta.url).href);
  map.colorSpace=T.SRGBColorSpace;map.wrapS=T.RepeatWrapping;
  map.minFilter=T.LinearMipmapLinearFilter;map.magFilter=T.LinearFilter;map.anisotropy=4;
  return map;
}

export async function loadPlanetPaint(definition) {
  const surface=await loadMap(textureCatalog[definition.name].full);
  try {
    return {surface,moon:definition.moon?await loadMap(textureCatalog.moon.full):null};
  } catch(error) {surface.dispose();throw error;}
}

export function disposePlanetPaint(paint) {
  paint?.surface.dispose();paint?.moon?.dispose();
}

function surface(definition,paintMap) {
  const seam=paintSeams[definition.name];
  return new T.ShaderMaterial({uniforms:{pigments:{value:definition.colors.map(c=>new T.Color(c))},paintMap:{value:paintMap},paintWindow:{value:new T.Vector2(...seam.window)},join:{value:seam.join},flowLeft:{value:seam.left},flowRight:{value:seam.right},belt:{value:definition.belt||Array(9).fill(.5)},beltLevel:{value:definition.beltLevel||.5},emphasis:{value:0}},vertexShader:vertex,
    fragmentShader:`varying vec3 p;varying vec3 n;uniform vec3 pigments[5];uniform float emphasis;uniform vec2 paintWindow;uniform float join[65];uniform float flowLeft[33];uniform float flowRight[33];uniform float belt[9];uniform float beltLevel;uniform sampler2D paintMap;
    // Cubic paint-space guide with its analytic slope. Keeping derivatives explicit
    // avoids the atan seam selecting a blurry mip level during a full revolution.
    vec2 guide(float x){
      float pos=clamp(x,0.,1.)*8.;int i=min(int(floor(pos)),7);float t=pos-float(i);
      float a=belt[max(i-1,0)],b=belt[i],c=belt[i+1],d=belt[min(i+2,8)];
      float A=-a+3.*b-3.*c+d,B=2.*a-5.*b+4.*c-d,C=-a+c;
      float v=.5*(2.*b+C*t+B*t*t+A*t*t*t);
      float slope=4.*(C+2.*B*t+3.*A*t*t);
      return vec2(clamp(v,.04,.96),slope);
    }
    vec3 paint(float x,float y,vec2 dx,vec2 dy){
      vec2 g=guide(x);
      // An odds-ratio warp maps the traced contour to one latitude. It is smooth,
      // strictly monotone and fixes both poles: no latitude clipping or mirrored paint.
      float k=(1.-g.x)*beltLevel/(g.x*(1.-beltLevel));
      float den=1.-y+k*y;
      float v=k*y/den;
      float dvdx=-v*(1.-v)*g.y/(g.x*(1.-g.x));
      float dvdy=k/(den*den);
      return textureGrad(paintMap,vec2(x,v),vec2(dx.x,dvdx*dx.x+dvdy*dx.y),vec2(dy.x,dvdx*dy.x+dvdy*dy.y)).rgb;
    }
    vec2 edgeFlow(float y,bool left){
      float row=clamp(y,0.,1.)*32.;int i=min(int(floor(row)),31);
      float a=left?flowLeft[i]:flowRight[i],b=left?flowLeft[i+1]:flowRight[i+1];
      return vec2(mix(a,b,row-float(i)),32.*(b-a));
    }
    vec3 joinedPaint(float x,float y,vec2 dx,vec2 dy,float longitude,bool left){
      vec2 flow=edgeFlow(y,left);
      float t=clamp((abs(longitude)-.012)/.168,0.,1.);
      float strength=1.-t*t*(3.-2.*t);
      float slope=-sign(longitude)*6.*t*(1.-t)/.168;
      float v=mix(y,flow.x,strength),dvdv=mix(1.,flow.y,strength);
      float dvdu=(flow.x-y)*slope/(paintWindow.y-paintWindow.x);
      return paint(x,v,vec2(dx.x,dvdu*dx.x+dvdv*dx.y),vec2(dy.x,dvdu*dy.x+dvdv*dy.y));
    }
    void main(){vec3 q=normalize(p);
      // A pigment-matched join follows the paint rather than a vertical fade strip.
      // Both samples stay inside the authored texture; no wrapped/clamped guide tails.
      float u=atan(q.x,q.z)/6.28318530718+.5;
      float y=asin(clamp(q.y,-1.,1.))/3.14159265359+.5;
      float span=paintWindow.y-paintWindow.x;
      float x=paintWindow.x+span*u;
      // Explicit angular derivatives keep mip selection continuous at atan's wrap.
      float denom=6.28318530718*max(dot(q.xz,q.xz),.0001);
      vec2 gradX=vec2(span*(q.z*dFdx(q.x)-q.x*dFdx(q.z))/denom,dFdx(y));
      vec2 gradY=vec2(span*(q.z*dFdy(q.x)-q.x*dFdy(q.z))/denom,dFdy(y));
      vec3 ink;
      float signedU=u>.5?u-1.:u;
      if(abs(signedU)<.18){
        float row=clamp(y,0.,1.)*64.;int i=min(int(floor(row)),63);
        float center=mix(join[i],join[i+1],row-float(i));
        float slope=64.*(join[i+1]-join[i]);
        float distance=signedU-center;
        float width=max(.003,abs(gradX.x/span-slope*dFdx(y))+abs(gradY.x/span-slope*dFdy(y)));
        if(distance < -width)ink=joinedPaint(paintWindow.y+span*signedU,y,gradX,gradY,signedU,true);
        else if(distance > width)ink=joinedPaint(paintWindow.x+span*signedU,y,gradX,gradY,signedU,false);
        else{
          vec3 left=joinedPaint(paintWindow.y+span*signedU,y,gradX,gradY,signedU,true);
          vec3 right=joinedPaint(paintWindow.x+span*signedU,y,gradX,gradY,signedU,false);
          ink=mix(left,right,smoothstep(-width,width,distance));
        }
      }else ink=paint(x,y,gradX,gradY);
      // Fixed, restrained illumination preserves the illustration's pigment values.
      vec3 normal=normalize(n);float light=dot(normal,normalize(vec3(-.60,.80,1.2)));
      float shade=.72+.28*smoothstep(-.10,.86,light);
      vec3 color=ink*shade;
      float rim=1.-smoothstep(.015,.10,normal.z);
      color=mix(color,pigments[4],rim*(.18+emphasis*.18));
      color*=1.+emphasis*.04;
      gl_FragColor=vec4(color,1.);
      #include <colorspace_fragment>
    }`});
}

export function createPlanet(image,d,paint) {
  const w=Number(image.dataset?.sourceWidth || image.naturalWidth),h=Number(image.dataset?.sourceHeight || image.naturalHeight),[cx,cy,r]=d.circle||[w/2,h/2,Math.min(w,h)/2];
  const root=new T.Group(),axis=new T.Group(),sphere=new T.Mesh(new T.SphereGeometry(1,64,40),surface(d,paint.surface));
  // Local Y is the polar axis for both the globe and its ring plane. A ring's
  // apparent minor/major ratio fixes the view elevation, not a separate tilt.
  const pitch=d.ring?Math.asin(d.ring[3]/d.ring[2]):.08;
  axis.rotation.set(pitch,0,d.tilt,'ZXY');axis.position.set(cx-w/2,h/2-cy,0);
  sphere.scale.setScalar(r);axis.add(sphere);root.add(axis);
  let ring=null;
  if(d.ring){
    const [,y,outer,,inner]=d.ring;
    ring=new T.Mesh(new T.RingGeometry(inner,outer,256),new T.ShaderMaterial({side:T.DoubleSide,transparent:true,depthWrite:false,
      uniforms:{inner:{value:inner},outer:{value:outer},style:{value:d.ringStyle},ink:{value:new T.Color(d.ringStyle===2?'#c3d3a7':d.ringStyle===4?'#66bcb3':d.ringStyle===3?'#f5b632':d.colors[d.ringStyle===1?2:4])},dark:{value:new T.Color(d.ringStyle===0?'#bca178':d.ringStyle===2?'#986e63':d.ringStyle===4?'#e5b66a':d.ringStyle===3?'#686c80':d.colors[1])}},vertexShader:vertex,
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
          }else if(style==2.){
            float first=stroke(t,.12,.027,pixel),middle=stroke(t,.46,.020,pixel),last=stroke(t,.86,.024,pixel);
            alpha=max(first,max(middle,last));color=mix(ink,dark,.35*last);
          }else{
            // Individually drawn, tapered sweeps. The radial curves stay in the
            // equatorial plane; angular variation gives the original ink character.
            float a=atan(p.y,p.x),right=cos(a),front=-sin(a);
            if(style==3.){
              float warm=smoothstep(-.12,.55,right);
              float taper=smoothstep(-.96,-.5,cos(a+.45));
              float main=stroke(t,.48+.035*sin(a+.5),(.035+.095*warm)*taper,pixel);
              float inside=stroke(t,.14+.03*sin(a),.065*smoothstep(-.4,.65,cos(a+.75)),pixel);
              float outside=stroke(t,.88+.025*cos(a),.023*smoothstep(-.3,.2,front)*smoothstep(-.95,-.6,right),pixel);
              alpha=max(main,max(inside,outside));color=mix(dark,ink,warm);
            }else{
              float main=stroke(t,.30+.045*sin(a+.4),.067*(.7+.3*cos(a-.5)),pixel);
              float innerArc=stroke(t,.075+.025*sin(a),.028*smoothstep(-.95,-.35,cos(a-.8)),pixel);
              float outerArc=stroke(t,.64+.035*cos(a+.4),.040*smoothstep(-.95,-.45,cos(a+1.8)),pixel);
              float gold=stroke(t,.92+.02*sin(a),.027*smoothstep(-.3,.6,cos(a+.4)),pixel);
              alpha=max(max(main,innerArc),max(outerArc,gold));
              color=mix(ink,dark,gold/max(alpha,.001));
            }
          }
          alpha*=smoothstep(0.,pixel,t)*(1.-smoothstep(1.-pixel,1.,t));
          if(alpha<.001)discard;
          color*=.90+.10*smoothstep(-outer*.4,outer*.4,p.y);
          gl_FragColor=vec4(color,alpha);
          #include <colorspace_fragment>
        }`}));
    ring.rotation.x=-Math.PI/2;
    // Low-set bands in the reference are translated along the same polar axis.
    ring.position.y=(cy-y)/Math.cos(pitch);axis.add(ring);
  }
  let moon=null;
  if(d.moon){
    const [x,y,radius]=d.moon;moon=new T.Mesh(new T.SphereGeometry(radius,32,24),surface({...d,name:'moon',belt:Array(9).fill(.5),beltLevel:.5,colors:['#35475a','#b77c94','#659e98','#d9bb87','#eed6ac']},paint.moon));
    moon.position.set(x-w/2,h/2-y,80);root.add(moon);
  }
  return {root,axis,sphere,ring,moon,material:sphere.material};
}
