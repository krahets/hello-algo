import * as THREE from "./vendor/three/three.module.min.js";
import { texture, loadImage, createRelief, planetDefinitions, createPaintedPlanet, createPaintedHourglass } from "./hero-art.js";

// Reference-view projection preserves the original art; depth supplies parallax.
export function createPlanets(map, items, onRestore) {
  const hero=map.closest('.home-div');
  const astronautItem=items.find(i=>i.astronaut),glassItem=items.find(i=>i.image.src.endsWith('/chapter_computational_complexity.png'));
  const groundImage=map.querySelector(':scope > img[src$="/ground.png"]');
  const linksImage=map.querySelector(':scope > img[src$="/links.png"]');
  const originals=[...items.map(i=>i.image),...map.querySelectorAll(':scope > img')];
  const renderer=new THREE.WebGLRenderer({alpha:true,antialias:true,powerPreference:'low-power'});
  renderer.setClearColor(0x000000,0);renderer.domElement.className='hero-objects-canvas';
  renderer.domElement.setAttribute('aria-hidden','true');
  renderer.debug.onShaderError=(gl,program,vertex,fragment)=>{throw new Error(`Hero shader: ${gl.getShaderInfoLog(vertex)} ${gl.getShaderInfoLog(fragment)}`);};
  const scene=new THREE.Scene(),camera=new THREE.OrthographicCamera(-1,1,1,-1,.1,5000);
  camera.position.z=2000;
  const targets=[],stage=new THREE.Group();scene.add(stage);
  let astronaut,ground,network,glass,held;
  let width=0,height=0,offsetX=0,offsetY=0,lost=false,disposed=false,ready=false;
  let centerX=0,centerY=0,sceneScale=1;
  const starGroups=[];
  let seed=73;const random=()=>{seed=(seed*1664525+1013904223)>>>0;return seed/4294967296;};
  for(let layer=0;layer<3;layer++) {
    const positions=new Float32Array(110*3),phase=new Float32Array(110);
    for(let i=0;i<110;i++){positions[i*3]=random()-.5;positions[i*3+1]=random()-.5;positions[i*3+2]=-780+layer*240+random()*120;phase[i]=random()*6.28;}
    const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.BufferAttribute(positions,3));g.setAttribute('phase',new THREE.BufferAttribute(phase,1));
    const material=new THREE.ShaderMaterial({transparent:true,depthWrite:false,uniforms:{time:{value:0},size:{value:1},opacity:{value:.27+layer*.10}},
      vertexShader:`attribute float phase;varying float a;uniform float time;uniform float size;
        void main(){a=.72+.28*sin(time*.5+phase);gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);gl_PointSize=size;}`,
      fragmentShader:`varying float a;uniform float opacity;void main(){float r=length(gl_PointCoord-.5)*2.;if(r>1.)discard;gl_FragColor=vec4(.78,.85,.83,(1.-smoothstep(.2,1.,r))*opacity*a);}`});
    const points=new THREE.Points(g,material);points.frustumCulled=false;scene.add(points);starGroups.push(points);
  }

  hero.insertBefore(renderer.domElement,map);
  const showOriginal=show=>{
    renderer.domElement.hidden=show;hero.classList.toggle('hero-three-active',!show);
    originals.forEach(img=>img.classList.toggle('hero-replaced',!show));
  };
  const rect=image=>({x:image.offsetLeft,y:image.offsetTop,width:image.offsetWidth,height:image.offsetHeight});
  function place(mesh,image,z=0){
    const r=rect(image);mesh.scale.set(r.width/image.naturalWidth,r.height/image.naturalHeight,r.height/image.naturalHeight);
    mesh.position.set(r.x+r.width/2-centerX,centerY-r.y-r.height/2,z);
  }
  function resize() {
    width=hero.clientWidth;height=hero.clientHeight;offsetX=map.offsetLeft;offsetY=map.offsetTop;
    renderer.setPixelRatio(Math.min(devicePixelRatio||1,matchMedia('(pointer: fine)').matches?1.5:1));
    renderer.setSize(Math.max(width,1),Math.max(height,1),false);
    camera.left=-width/2;camera.right=width/2;camera.top=height/2;camera.bottom=-height/2;camera.updateProjectionMatrix();
    starGroups.forEach((g,i)=>{g.scale.set(width*1.12,height*1.12,1);g.material.uniforms.size.value=(1.2+i*.65)*renderer.getPixelRatio();});
    if(!ready)return;
    for(const target of targets)target.rect=rect(target.item.image);
    const ar=rect(astronautItem.image);centerX=ar.x+ar.width/2;centerY=ar.y+ar.height/2;sceneScale=ar.height/672;
    place(astronaut,astronautItem.image,25*sceneScale);place(ground,groundImage,-160*sceneScale);
    const gr=rect(glassItem.image),glassScale=gr.height/.84;
    held.scale.setScalar(glassScale);
    held.position.set(gr.x+gr.width/2-centerX,centerY-gr.y-gr.height,105*sceneScale);
    const lr=rect(linksImage);
    network.scale.set(lr.width,lr.height,1);
    network.position.set(offsetX+lr.x+lr.width/2-width/2,height/2-offsetY-lr.y-lr.height/2,-350);
  }
  function render(time,enabled,pointer={x:0,y:0}) {
    if(disposed)return;
    if(!enabled||lost||!ready||!width||!height){showOriginal(true);return;}
    for(const target of targets){
      const {item,rect,root,sphere,material,axis}=target;
      const selected=item.anchor.classList.contains('hero-selected');
      const fit=rect.height/item.image.naturalHeight*(selected?1.035:1);
      root.scale.setScalar(fit);
      root.position.set(offsetX+rect.x+rect.width/2+item.x-width/2,height/2-offsetY-rect.y-rect.height/2-item.y,0);
      root.rotation.z=-item.angle*Math.PI/180;
      // Single-view artwork supports a restrained sweep, not a fabricated 360° skin.
      // Real sphere rotation, smooth reversal, and no seam/lighting drift from unseen sides.
      sphere.quaternion.setFromAxisAngle(axis,.20*Math.sin(time*Math.PI*2/(target.period/2.5)));
      material.uniforms.emphasis.value=selected?1:0;
    }
    stage.position.set(offsetX+centerX-width/2+(astronautItem?.x||0),height/2-offsetY-centerY-(astronautItem?.y||0),80);
    // Fixed-view depth art: keep yaw/pitch within ±2°, never expose invented backs.
    stage.rotation.set(pointer.y*.018,pointer.x*.032,0);
    astronaut.material.uniforms.emphasis.value=astronautItem.anchor.classList.contains('hero-selected')?1:0;
    glass.update(time);
    starGroups.forEach((g,i)=>{g.position.x=pointer.x*(3+i*4);g.position.y=-pointer.y*(2+i*3);g.material.uniforms.time.value=time;});
    const selected=items.some(i=>i.anchor.classList.contains('hero-selected'));
    network.material.opacity=selected?.92:.74;
    renderer.render(scene,camera);showOriginal(false);
    renderer.domElement.dataset.drawCalls=String(renderer.info.render.calls);
    renderer.domElement.dataset.triangles=String(renderer.info.render.triangles);
    renderer.domElement.dataset.art='original-projection';
    renderer.domElement.dataset.network='original-brushwork';
    renderer.domElement.dataset.rotation='bounded-11.5-degrees';
  }
  const onLost=event=>{event.preventDefault();lost=true;showOriginal(true);};
  const onRestored=()=>{lost=false;resize();onRestore();};
  const onLoad=()=>{resize();onRestore();};
  renderer.domElement.addEventListener('webglcontextlost',onLost);renderer.domElement.addEventListener('webglcontextrestored',onRestored);
  originals.forEach(img=>img.addEventListener('load',onLoad));showOriginal(true);resize();
  const readyPromise=Promise.all([
    Promise.all(originals.map(img=>img.decode())),
    loadImage(new URL('./hero-textures/astronaut-hand.webp',import.meta.url)),
    loadImage(new URL('./hero-textures/ground-restored.webp',import.meta.url)),
  ]).then(([,handRepair,groundRepair])=>{
    if(disposed)return;
    for(const definition of planetDefinitions){
      const item=items.find(i=>i.image.src.endsWith('/chapter_'+definition.name+'.png'));
      if(!item)continue;
      const target={...definition,item,...createPaintedPlanet(item.image,definition)};
      scene.add(target.root);targets.push(target);
    }
    astronaut=createRelief(astronautItem.image,handRepair,1);ground=createRelief(groundImage,groundRepair,2);
    stage.add(ground,astronaut);
    glass=createPaintedHourglass(glassItem.image);
    held=new THREE.Group();held.add(glass.root);stage.add(held);
    network=new THREE.Mesh(new THREE.PlaneGeometry(1,1),new THREE.MeshBasicMaterial({map:texture(linksImage),transparent:true,depthWrite:false}));
    scene.add(network);ready=true;resize();onRestore();
  }).catch(error=>{if(!disposed){showOriginal(true);console.warn('Original illustration retained: depth art unavailable.',error);}});
  return {resize,render,ready:readyPromise,dispose(){
    disposed=true;showOriginal(true);originals.forEach(img=>img.removeEventListener('load',onLoad));
    renderer.domElement.removeEventListener('webglcontextlost',onLost);renderer.domElement.removeEventListener('webglcontextrestored',onRestored);
    const geometries=new Set(),materials=new Set(),textures=new Set();scene.traverse(o=>{if(o.geometry)geometries.add(o.geometry);if(o.material)materials.add(o.material);});
    geometries.forEach(g=>g.dispose());materials.forEach(m=>{if(m.map)textures.add(m.map);Object.values(m.uniforms||{}).forEach(u=>{if(u.value?.isTexture)textures.add(u.value);});m.dispose();});
    textures.forEach(t=>t.dispose());renderer.dispose();renderer.forceContextLoss();renderer.domElement.remove();
  }};
}
