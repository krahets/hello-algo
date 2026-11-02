/* Chapter identities, rebuilt as seamless object-space paint for full rotation. */
import * as T from './vendor/three/three.module.min.js';

// Palette order: deep ink, secondary pigment, body, accent, paper highlight.
// Shapes describe the original illustration's visual vocabulary, not its pixels.
export const planets = [
  {name:'array_and_linkedlist',kind:0,period:76,tilt:.59,colors:['#554f6d','#99748b','#d9bd83','#f3dca0','#fff0bd'],circle:[237,166,130],ring:[237,166,277,51,176],ringStyle:0},
  {name:'stack_and_queue',kind:1,period:69,tilt:-.12,colors:['#263f56','#438c97','#e4b044','#4fa4a4','#f6ce64']},
  {name:'hashing',kind:2,period:63,tilt:-.72,colors:['#294459','#a56870','#4a9e9b','#efad48','#f8d687']},
  {name:'tree',kind:3,period:83,tilt:.28,colors:['#264458','#aa866e','#188e84','#cfcc94','#f1d99b']},
  {name:'heap',kind:4,period:55,tilt:.60,colors:['#273e52','#ad7c99','#b4c67e','#ddab98','#e9d8a0']},
  {name:'graph',kind:5,period:89,tilt:.27,colors:['#464464','#786587','#be8d9d','#e3a493','#f2ce9b'],circle:[270,136,135],ring:[270,136,280,9,146],ringStyle:1},
  {name:'searching',kind:6,period:58,tilt:.24,colors:['#4b526d','#a7788a','#63a5a0','#a6b28c','#eddb9e']},
  {name:'sorting',kind:7,period:52,tilt:-.5,colors:['#3e3d57','#b57191','#eaa9ae','#f6df98','#fff0b5']},
  {name:'divide_and_conquer',kind:8,period:94,tilt:.58,colors:['#494a63','#b6777e','#e5a129','#f3c45c','#ffe6a1'],circle:[156,130,117],ring:[203,134,240,60,164],ringStyle:2,moon:[307,50,33]},
  {name:'backtracking',kind:9,period:81,tilt:-.08,colors:['#36475c','#727887','#eead30','#c58c4d','#f7d27b'],circle:[166,115,115],ring:[173,159,173,70,126],ringStyle:3},
  {name:'dynamic_programming',kind:10,period:67,tilt:-.48,colors:['#36394f','#8c4b6d','#d36959','#ed9d46','#f5cb6e']},
  {name:'greedy',kind:11,period:72,tilt:-.57,colors:['#234c60','#32878d','#72b1a7','#b9bd84','#e8ba66'],circle:[135,85,83],ring:[133,101,149,61,111],ringStyle:4},
];

const vertex=`varying vec3 p;varying vec3 n;
  void main(){p=position;n=normalize(normalMatrix*normal);
  gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}`;
const noise=`
  float hash(vec3 v){v=fract(v*.3183099+vec3(.13,.71,.37));v*=17.;return fract(v.x*v.y*v.z*(v.x+v.y+v.z));}
  float noise(vec3 v){vec3 i=floor(v),f=fract(v);f=f*f*(3.-2.*f);
    return mix(mix(mix(hash(i),hash(i+vec3(1,0,0)),f.x),mix(hash(i+vec3(0,1,0)),hash(i+vec3(1,1,0)),f.x),f.y),
      mix(mix(hash(i+vec3(0,0,1)),hash(i+vec3(1,0,1)),f.x),mix(hash(i+vec3(0,1,1)),hash(i+vec3(1,1,1)),f.x),f.y),f.z);}
  float paint(vec3 v){return noise(v)*.62+noise(v*2.07+3.7)*.26+noise(v*4.03)*.12;}
  float edge(float a,float v){return smoothstep(a-.012,a+.012,v);}
`;

function surface(definition) {
  return new T.ShaderMaterial({uniforms:{pigments:{value:definition.colors.map(c=>new T.Color(c))},kind:{value:definition.kind},emphasis:{value:0}},vertexShader:vertex,
    fragmentShader:`varying vec3 p;varying vec3 n;uniform vec3 pigments[5];uniform float kind;uniform float emphasis;
    ${noise}
    void main(){vec3 q=normalize(p);float broad=paint(q*2.7+kind*2.3),fine=paint(q*vec3(8.,2.,8.)+kind);
      float bend=kind<.5?.48:(kind>4.5&&kind<5.5?.22:(kind>7.5&&kind<8.5?.32:.14));
      float latitude=q.y+(broad-.5)*bend;
      float stripe=.5+.5*sin(latitude*12.+(fine-.5)*.35);
      vec3 ink=pigments[2];
      if(kind<.5){ // Cream Saturn: wide asymmetric lavender belts and fine ochre brushlines.
        ink=mix(pigments[1],pigments[2],edge(-.17,latitude));
        ink=mix(ink,pigments[3],edge(.40,latitude));
        ink=mix(ink,pigments[0],edge(.78,stripe)*.24);
        ink=mix(ink,pigments[4],edge(.90,.5+.5*sin(latitude*34.+broad))*edge(.48,fine)*.32);
      }else if(kind<1.5){ // Gold northern landmass, teal southern oceans and dark parallel currents.
        ink=mix(pigments[3],pigments[2],edge(.04,latitude));
        float islands=paint(q*4.5+3.);
        ink=mix(ink,pigments[1],edge(.62,islands)*edge(.04,q.y));
        ink=mix(ink,pigments[0],edge(.76,.5+.5*sin(latitude*25.))* (1.-edge(.1,q.y))*.80);
      }else if(kind<2.5){ // Diagonal warm/cool split, fine slanting streaks.
        ink=mix(pigments[2],pigments[3],edge(.08,latitude));
        ink=mix(ink,pigments[1],edge(.83,stripe)*edge(.02,q.y)*.85);
        ink=mix(ink,pigments[0],edge(.63,paint(q*vec3(9.,3.,9.)))*(1.-edge(.0,q.y))*.75);
        ink=mix(ink,pigments[4],edge(.94,.5+.5*sin(latitude*31.))*edge(.46,fine)*.45);
      }else if(kind<3.5){ // Large irregular cream continents; no latitude bands.
        float continents=paint(q*2.+vec3(2.,4.,8.));
        ink=mix(pigments[2],pigments[3],edge(.52,continents));
        ink=mix(ink,pigments[4],edge(.65,continents));
        ink=mix(ink,pigments[1],edge(.66,paint(q*5.8+13.))*(1.-edge(.52,continents))*.85);
      }else if(kind<4.5){ // Sage and mauve diagonal ribbons, dark broken scratches.
        ink=mix(pigments[1],pigments[2],edge(.42,stripe));
        ink=mix(ink,pigments[3],edge(.86,stripe));
        ink=mix(ink,pigments[0],edge(.88,.5+.5*sin(latitude*27.+broad*2.))*edge(.52,fine)*.65);
      }else if(kind<5.5){ // Dusty purple globe, coral north and flat elongated marks.
        ink=mix(pigments[1],pigments[2],edge(.03,latitude));
        ink=mix(ink,pigments[3],edge(.56,latitude));
        ink=mix(ink,pigments[0],edge(.73,stripe)*.7);
        ink=mix(ink,pigments[4],edge(.93,.5+.5*sin(latitude*28.))*edge(.35,q.y)*edge(.48,fine)*.35);
      }else if(kind<6.5){ // Broad teal, muted lavender and cream flowing patches.
        float field=.5+.25*sin(q.y*5.+paint(q*1.7)*4.)+(paint(q*2.)-.5)*.15;
        ink=pigments[0];ink=mix(ink,pigments[1],edge(.28,field));ink=mix(ink,pigments[2],edge(.43,field));
        ink=mix(ink,pigments[3],edge(.65,field));ink=mix(ink,pigments[4],edge(.78,field));
      }else if(kind<7.5){ // Small rose/yellow mottled world.
        float field=paint(q*2.5+11.);
        ink=mix(pigments[1],pigments[3],edge(.50,field));
        ink=mix(ink,pigments[0],edge(.72,paint(q*4.))*.8);
        ink=mix(ink,pigments[2],edge(.60,field));
      }else if(kind<8.5){ // Amber gas giant, mauve storm belts and elongated cream streaks.
        ink=mix(pigments[2],pigments[1],edge(.86,stripe)*.8);
        ink=mix(ink,pigments[3],edge(.40,latitude));
        ink=mix(ink,pigments[4],edge(.90,.5+.5*sin(latitude*28.+fine))*edge(.45,fine)*.5);
        ink=mix(ink,pigments[0],edge(.78,paint(q*vec3(9.,3.,9.)))*.50);
      }else if(kind<9.5){ // Mustard globe with a broad slate lower belt.
        ink=mix(pigments[1],pigments[2],edge(-.20,latitude));
        ink=mix(ink,pigments[3],edge(.91,stripe)*.75);
        ink=mix(ink,pigments[0],edge(.91,.5+.5*sin(latitude*28.))*(1.-edge(-.05,q.y))*.85);
      }else if(kind<10.5){ // Orange-red swirling flames and wine-purple eddies.
        float swirls=.5+.5*sin(q.y*7.+paint(q*1.8)*8.+q.x*1.5);
        ink=mix(pigments[1],pigments[2],edge(.30,swirls));
        ink=mix(ink,pigments[3],edge(.68,swirls));ink=mix(ink,pigments[4],edge(.91,swirls));
      }else{ // Teal curling streams with a few sand-coloured streaks.
        float flow=.5+.5*sin(q.y*10.+paint(q*1.8)*6.);
        ink=mix(pigments[1],pigments[2],edge(.50,flow));
        ink=mix(ink,pigments[0],edge(.88,flow));
        ink=mix(ink,pigments[4],edge(.95,flow)*edge(.42,broad));
      }
      // A stationary, gently stepped key light reveals curvature while the paint rotates.
      vec3 normal=normalize(n);float light=dot(normal,normalize(vec3(-.60,.80,1.2)));
      float shade=.45+.22*smoothstep(-.12,-.04,light)+.21*smoothstep(.33,.45,light)+.12*smoothstep(.74,.86,light);
      vec3 color=mix(ink*shade,pigments[0]*.5,(1.-shade)*.20);
      float rim=1.-smoothstep(.015,.10,normal.z);
      color=mix(color,pigments[4],rim*.35);
      color*=1.+emphasis*.09;
      gl_FragColor=vec4(color,1.);
      #include <colorspace_fragment>
    }`});
}

export function createPlanet(image,d) {
  const w=image.naturalWidth,h=image.naturalHeight,[cx,cy,r]=d.circle||[w/2,h/2,Math.min(w,h)/2];
  const root=new T.Group(),axis=new T.Group(),sphere=new T.Mesh(new T.SphereGeometry(1,64,40),surface(d));
  axis.rotation.z=d.tilt;axis.rotation.x=.15;axis.position.set(cx-w/2,h/2-cy,0);
  sphere.scale.setScalar(r);axis.add(sphere);root.add(axis);
  if(d.ring){
    const [x,y,outer,minor,inner]=d.ring;
    const ring=new T.Mesh(new T.RingGeometry(inner,outer,160),new T.ShaderMaterial({side:T.DoubleSide,transparent:true,
      uniforms:{inner:{value:inner},outer:{value:outer},style:{value:d.ringStyle},ink:{value:new T.Color(d.ringStyle===2?'#c3d3a7':d.ringStyle===4?'#6bb5ae':d.colors[d.ringStyle===1?2:4])},dark:{value:new T.Color(d.ringStyle===2?'#986e63':d.ringStyle===4?'#d49861':d.colors[1])}},vertexShader:vertex,
      fragmentShader:`varying vec3 p;uniform float inner;uniform float outer;uniform float style;uniform vec3 ink;uniform vec3 dark;
        void main(){float t=(length(p.xy)-inner)/(outer-inner);float bands=.5+.5*sin(t*42.);float alpha=1.;
          if(style==2.||style==4.){alpha=smoothstep(.75,.92,.5+.5*sin(t*25.));if(alpha<.1)discard;}
          if(style==3.){alpha=smoothstep(.75,.94,.5+.5*sin(t*20.));if(alpha<.1)discard;}
          if(style==0.&&t>.72&&t<.76)discard;
          vec3 color=mix(dark,ink,.50+bands*.48);
          color*=.86+.14*smoothstep(-outer*.4,outer*.4,p.y);
          gl_FragColor=vec4(color,alpha);
          #include <colorspace_fragment>
        }`}));
    ring.rotation.set(Math.acos(minor/outer),0,d.tilt,'ZXY');
    ring.position.set(x-w/2,h/2-y,0);root.add(ring);
  }
  if(d.moon){
    const [x,y,radius]=d.moon,moon=new T.Mesh(new T.SphereGeometry(radius,32,24),surface({...d,kind:7,colors:['#35475a','#b77c94','#659e98','#d9bb87','#eed6ac']}));
    moon.position.set(x-w/2,h/2-y,80);root.add(moon);
  }
  return {root,sphere,material:sphere.material};
}
