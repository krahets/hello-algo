import * as THREE from "./vendor/three/three.module.min.js";
import { createAstronaut, createPlatform, createHourglass } from "./hero-model.js";

// Object-space pigments rotate with the sphere. View-space light stays fixed.
const vertexShader = `
  varying vec3 vObject;
  varying vec3 vNormal;
  void main() {
    vObject = position;
    vNormal = normalize(normalMatrix * normal);
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  }
`;
const noiseShader = `
  float hash(vec3 p) {
    p = fract(p * 0.3183099 + vec3(0.13, 0.71, 0.37));
    p *= 17.0;
    return fract(p.x * p.y * p.z * (p.x + p.y + p.z));
  }
  float noise(vec3 p) {
    vec3 i = floor(p), f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(mix(hash(i), hash(i+vec3(1,0,0)), f.x),
                   mix(hash(i+vec3(0,1,0)), hash(i+vec3(1,1,0)), f.x), f.y),
               mix(mix(hash(i+vec3(0,0,1)), hash(i+vec3(1,0,1)), f.x),
                   mix(hash(i+vec3(0,1,1)), hash(i+vec3(1,1,1)), f.x), f.y), f.z);
  }
  float paint(vec3 p) {
    return noise(p)*0.62 + noise(p*2.07+3.7)*0.26 + noise(p*4.03)*0.12;
  }
`;
const fragmentShader = `
  varying vec3 vObject;
  varying vec3 vNormal;
  uniform vec3 pigments[5];
  uniform float banded;
  uniform float emphasis;
  uniform float variation;
  ${noiseShader}
  void main() {
    vec3 p = normalize(vObject);
    float warp = paint(p * vec3(3.1, 2.2, 3.1) + variation);
    float stripe = p.y * 1.65 + warp * 0.55;
    float pigmentField = 0.5 + 0.25*sin(p.y*(5.0+variation*.5) + paint(p*1.7+variation)*4.0) + (paint(p*2.0)-0.5)*0.15;
    if(variation>1.5 && variation<2.5) pigmentField=.25+paint(p*3.+variation)*.7;
    float field = mix(pigmentField, (sin(stripe * 3.14159) * 0.5 + 0.5), banded);
    vec3 ink = pigments[0];
    ink = mix(ink, pigments[1], smoothstep(0.28, 0.30, field));
    ink = mix(ink, pigments[2], smoothstep(0.43, 0.45, field));
    ink = mix(ink, pigments[3], smoothstep(0.58, 0.60, field));
    ink = mix(ink, pigments[4], smoothstep(0.74, 0.76, field));
    // Sparse, broken brush lines rather than photographic noise or gloss.
    float brush = smoothstep(0.91, 0.97, sin(stripe * 38.0 + paint(p*7.0)*1.0));
    brush *= smoothstep(0.50, 0.72, paint(p * vec3(7.0, 1.5, 7.0)));
    ink = mix(ink, pigments[4], brush * 0.16);
    vec3 n = normalize(vNormal);
    float light = dot(n, normalize(vec3(-0.6, 0.8, 1.2)));
    float shade = 0.46 + 0.22*smoothstep(-0.12, -0.04, light)
                       + 0.20*smoothstep(0.33, 0.42, light)
                       + 0.12*smoothstep(0.75, 0.85, light);
    vec3 shadow = vec3(0.11, 0.085, 0.18);
    ink = mix(ink * shade, shadow, (1.0-shade)*0.25);
    float rim = (1.0-smoothstep(0.015, 0.11, n.z));
    ink = mix(ink, pigments[3], rim * 0.45);
    ink *= 1.0 + emphasis * 0.09;
    gl_FragColor = vec4(ink, 1.0);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
  }
`;
const ringFragment = `
  varying vec3 vObject;
  varying vec3 vNormal;
  uniform vec3 ringColor;
  void main() {
    float r = length(vObject.xy);
    if ((r>1.58 && r<1.64) || (r>1.83 && r<1.85)) discard;
    float bands = sin(r*48.0)*0.5+0.5;
    vec3 color = mix(vec3(0.58,0.43,0.26), vec3(0.95,0.82,0.49), bands);
    color = mix(color, vec3(1.0,0.93,0.67), smoothstep(0.72,0.96,sin(r*33.0)*0.5+0.5)*0.6);
    float shadow = smoothstep(-0.95, -0.7, vObject.x) * (1.0-smoothstep(-0.05, 0.45, vObject.y));
    color *= (0.82 + shadow*0.18);
    color = mix(color, ringColor * (0.65+bands*.35), .45);
    gl_FragColor = vec4(color, 1.0);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
  }
`;

// Every chapter keeps its original DOM layout and native link; only its pixels change.
export function createPlanets(map, items, onRestore) {
  const definitions = [
    ['array_and_linkedlist',true,76,.55,['#5f546c','#a8798b','#d9a36f','#e8c27f','#fff0ba']],
    ['stack_and_queue',false,69,-.35,['#263f56','#2c6c79','#4aa2a5','#b1b078','#edba4b']],
    ['hashing',false,63,.65,['#2c3e59','#348d92','#86b39d','#d78a67','#e7b159']],
    ['tree',false,83,-.42,['#273e54','#35737d','#5caa9b','#bfc084','#f0d69e']],
    ['heap',false,55,-.7,['#2f3e55','#65758b','#b1809a','#b0bd80','#e4d297']],
    ['graph',true,89,-.25,['#454362','#6c6384','#a47f94','#d39d93','#ebc19b']],
    ['searching',false,58,-.24,['#4b526d','#a7788a','#63a5a0','#a6b28c','#eddb9e']],
    ['sorting',false,52,.7,['#493f59','#a06c8c','#d58b9b','#e6b379','#f8e7a6']],
    ['divide_and_conquer',true,94,.60,['#5c536e','#b57f7d','#dba450','#ebc168','#fff0b4']],
    ['backtracking',true,81,-.24,['#55596a','#998377','#cf9e61','#e3b14b','#f4d082']],
    ['dynamic_programming',false,67,.50,['#36364f','#6f4e70','#bd6877','#e49163','#f2c969']],
    ['greedy',true,72,-.55,['#234c60','#32878d','#72b1a7','#b9bd84','#e8ba66']],
  ];
  const targets=definitions.map(([name,ring,period,tilt,colors],index)=>({name,ring,period,tilt,colors,index,
    item:items.find(i=>i.image.src.endsWith('/chapter_'+name+'.png'))})).filter(t=>t.item);
  const hero=map.closest('.home-div');
  const astronautItem=items.find(i=>i.astronaut),glassItem=items.find(i=>i.image.src.endsWith('/chapter_computational_complexity.png'));
  const originals=[...items.map(i=>i.image),...map.querySelectorAll(':scope > img')];
  const renderer=new THREE.WebGLRenderer({alpha:true,antialias:true,powerPreference:'low-power'});
  renderer.setClearColor(0x000000,0);renderer.domElement.className='hero-objects-canvas';
  renderer.domElement.setAttribute('aria-hidden','true');
  renderer.debug.onShaderError=(gl,program,vertex,fragment)=>{throw new Error(`Hero shader: ${gl.getShaderInfoLog(vertex)} ${gl.getShaderInfoLog(fragment)}`);};
  const scene=new THREE.Scene(),camera=new THREE.OrthographicCamera(-1,1,1,-1,.1,5000);
  camera.position.z=2000;
  const geometry=new THREE.SphereGeometry(1,48,32);
  for(const target of targets) {
    const root=new THREE.Group(),spin=new THREE.Group();
    spin.rotation.x=target.ring?1.16-Math.PI/2:.15;
    const material=new THREE.ShaderMaterial({vertexShader,fragmentShader,uniforms:{
      pigments:{value:target.colors.map(c=>new THREE.Color(c))},banded:{value:target.ring?1:0},emphasis:{value:0},variation:{value:target.index*.51}}});
    spin.add(new THREE.Mesh(geometry,material));root.add(spin);root.rotation.z=target.tilt;
    if(target.ring) {
      const rings=new THREE.Mesh(new THREE.RingGeometry(1.18,1.96,128),new THREE.ShaderMaterial({vertexShader,fragmentShader:ringFragment,side:THREE.DoubleSide,uniforms:{ringColor:{value:new THREE.Color(target.colors[3])}}}));
      rings.rotation.x=target.name==='graph'?1.43:target.name==='divide_and_conquer'?.96:target.name==='greedy'?1.30:1.16;root.add(rings);
    }
    scene.add(root);root.updateMatrixWorld(true);
    const extent=new THREE.Box3().setFromObject(root,true).getSize(new THREE.Vector3());
    Object.assign(target,{root,spin,material,extent});
  }
  const astronaut=createAstronaut(),platform=createPlatform(),glass=createHourglass(astronaut.materials);
  const stage=new THREE.Group();stage.add(astronaut.root,platform);scene.add(stage);
  const held=new THREE.Group();held.position.copy(astronaut.palm);held.add(glass.root);astronaut.body.add(held);
  stage.rotation.x=.38;stage.rotation.y=-.09;
  // Fixed orthographic camera: depth is supplied by geometry, lighting and restrained parallax.
  const starGroups=[];
  let seed=73;const random=()=>{seed=(seed*1664525+1013904223)>>>0;return seed/4294967296;};
  for(let layer=0;layer<3;layer++) {
    const positions=new Float32Array(110*3),phase=new Float32Array(110);
    for(let i=0;i<110;i++){positions[i*3]=random()-.5;positions[i*3+1]=random()-.5;positions[i*3+2]=-300-layer*240+random()*120;phase[i]=random()*6.28;}
    const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.BufferAttribute(positions,3));g.setAttribute('phase',new THREE.BufferAttribute(phase,1));
    const material=new THREE.ShaderMaterial({transparent:true,depthWrite:false,uniforms:{time:{value:0},size:{value:1},opacity:{value:.27+layer*.10}},
      vertexShader:`attribute float phase;varying float a;uniform float time;uniform float size;
        void main(){a=.72+.28*sin(time*.5+phase);gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);gl_PointSize=size;}`,
      fragmentShader:`varying float a;uniform float opacity;void main(){float r=length(gl_PointCoord-.5)*2.;if(r>1.)discard;gl_FragColor=vec4(.78,.85,.83,(1.-smoothstep(.2,1.,r))*opacity*a);}`});
    const points=new THREE.Points(g,material);points.frustumCulled=false;scene.add(points);starGroups.push(points);
  }
  // Delicate spatial chapter orbits replace the bright, baked-in network artwork.
  const network=new THREE.Group();scene.add(network);
  const orbitMaterials=[];
  for(let i=0;i<4;i++) {
    const pts=[];for(let j=0;j<=180;j++){const a=j/180*Math.PI*2;pts.push(new THREE.Vector3(Math.cos(a)*(1+i*.012),Math.sin(a)*(1+i*.012),Math.sin(a*2+i)*.10));}
    const material=new THREE.LineBasicMaterial({color:i%2?'#5a807b':'#a7b5a0',transparent:true,opacity:i===0?.30:.11});
    network.add(new THREE.Line(new THREE.BufferGeometry().setFromPoints(pts),material));orbitMaterials.push(material);
  }
  hero.insertBefore(renderer.domElement,map);
  let width=0,height=0,offsetX=0,offsetY=0,lost=false,disposed=false,stageScale=1,stageX=0,stageY=0;
  const showOriginal=show=>{
    renderer.domElement.hidden=show;hero.classList.toggle('hero-three-active',!show);
    originals.forEach(img=>img.classList.toggle('hero-replaced',!show));
  };
  function resize() {
    width=hero.clientWidth;height=hero.clientHeight;offsetX=map.offsetLeft;offsetY=map.offsetTop;
    renderer.setPixelRatio(Math.min(devicePixelRatio||1,matchMedia('(pointer: fine)').matches?1.5:1));
    renderer.setSize(Math.max(width,1),Math.max(height,1),false);
    camera.left=-width/2;camera.right=width/2;camera.top=height/2;camera.bottom=-height/2;camera.updateProjectionMatrix();
    for(const target of targets){const i=target.item.image;target.rect={x:i.offsetLeft,y:i.offsetTop,width:i.offsetWidth,height:i.offsetHeight};}
    if(astronautItem){const img=astronautItem.image;stageScale=img.offsetHeight/3.91;
      stageX=offsetX+img.offsetLeft+img.offsetWidth*.65-width/2;
      stageY=height/2-offsetY-img.offsetTop-img.offsetHeight*.93;}
    stage.scale.setScalar(stageScale);
    starGroups.forEach((g,i)=>{g.scale.set(width*1.12,height*1.12,1);g.material.uniforms.size.value=(1.2+i*.65)*renderer.getPixelRatio();});
    network.position.set(offsetX+map.clientWidth*.51-width/2,height/2-offsetY-map.clientHeight*.46,-130);
    network.scale.set(map.clientWidth*.395,map.clientHeight*.385,180);
  }
  function render(time,enabled,pointer={x:0,y:0}) {
    if(disposed)return;
    if(!enabled||lost||!width||!height){showOriginal(true);return;}
    for(const target of targets){
      const {item,rect,root,spin,material,extent}=target;
      const selected=item.anchor.classList.contains('hero-selected');
      const fit=Math.min(rect.width/extent.x,rect.height/extent.y)*.98;
      root.scale.setScalar(fit*(selected?1.045:1));
      root.position.set(offsetX+rect.x+rect.width/2+item.x-width/2,height/2-offsetY-rect.y-rect.height/2-item.y,0);
      root.rotation.z=target.tilt-item.angle*Math.PI/180;spin.rotation.y=time*Math.PI*2/target.period+.4;
      material.uniforms.emphasis.value=selected?1:0;
    }
    // A seated figure shares its translation with its platform. Breathing moves only the torso.
    stage.position.set(stageX+(astronautItem?.x||0),stageY-(astronautItem?.y||0),80);
    astronaut.body.position.y=Math.sin(time*1.15)*.009;
    astronaut.helmet.rotation.y=pointer.x*.055;astronaut.helmet.rotation.x=pointer.y*.025;
    glass.update(time);
    starGroups.forEach((g,i)=>{g.position.x=pointer.x*(3+i*4);g.position.y=-pointer.y*(2+i*3);g.material.uniforms.time.value=time;});
    const selected=items.some(i=>i.anchor.classList.contains('hero-selected'));
    orbitMaterials.forEach((m,i)=>{m.opacity=(i===0?.30:.11)*(selected?1.55:1);});
    renderer.render(scene,camera);showOriginal(false);
    renderer.domElement.dataset.drawCalls=String(renderer.info.render.calls);
    renderer.domElement.dataset.triangles=String(renderer.info.render.triangles);
  }
  const onLost=event=>{event.preventDefault();lost=true;showOriginal(true);};
  const onRestored=()=>{lost=false;resize();onRestore();};
  const onLoad=()=>{resize();onRestore();};
  renderer.domElement.addEventListener('webglcontextlost',onLost);renderer.domElement.addEventListener('webglcontextrestored',onRestored);
  originals.forEach(img=>img.addEventListener('load',onLoad));showOriginal(true);resize();
  return {resize,render,dispose(){
    disposed=true;showOriginal(true);originals.forEach(img=>img.removeEventListener('load',onLoad));
    renderer.domElement.removeEventListener('webglcontextlost',onLost);renderer.domElement.removeEventListener('webglcontextrestored',onRestored);
    const geometries=new Set(),materials=new Set();scene.traverse(o=>{if(o.geometry)geometries.add(o.geometry);if(o.material)materials.add(o.material);});
    geometries.forEach(g=>g.dispose());materials.forEach(m=>m.dispose());renderer.dispose();renderer.forceContextLoss();renderer.domElement.remove();
  }};
}
