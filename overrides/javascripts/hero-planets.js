import * as THREE from "./vendor/three/three.module.min.js";
import { planets, createPlanet } from "./hero-surfaces.js";

// The illustration supplies composition; each globe is independently lit and rotates fully.
export function createPlanets(map, items, onRestore) {
  const targets=planets.map(d=>({...d,item:items.find(i=>i.image.src.endsWith('/chapter_'+d.name+'.png'))})).filter(d=>d.item);
  const hero=map.closest('.home-div');
  const renderer=new THREE.WebGLRenderer({alpha:true,antialias:true,powerPreference:'low-power'});
  renderer.setClearColor(0x000000,0);renderer.domElement.className='hero-objects-canvas';
  renderer.domElement.setAttribute('aria-hidden','true');
  renderer.debug.onShaderError=(gl,program,vertex,fragment)=>{throw new Error(`Hero shader: ${gl.getShaderInfoLog(vertex)} ${gl.getShaderInfoLog(fragment)}`);};
  const scene=new THREE.Scene(),camera=new THREE.OrthographicCamera(-1,1,1,-1,.1,5000);
  camera.position.z=2000;
  map.insertBefore(renderer.domElement,map.querySelector(':scope > a'));
  let width=0,height=0,lost=false,disposed=false,ready=false;
  const showOriginal=show=>{
    renderer.domElement.hidden=show;hero.classList.toggle('hero-three-active',!show);
    targets.forEach(({item})=>item.image.classList.toggle('hero-replaced',!show));
  };
  function resize(){
    width=map.clientWidth;height=map.clientHeight;
    renderer.setPixelRatio(Math.min(devicePixelRatio||1,matchMedia('(pointer: fine)').matches?1.5:1));
    renderer.setSize(Math.max(width,1),Math.max(height,1),false);
    camera.left=-width/2;camera.right=width/2;camera.top=height/2;camera.bottom=-height/2;camera.updateProjectionMatrix();
    for(const target of targets){const i=target.item.image;target.rect={x:i.offsetLeft,y:i.offsetTop,width:i.offsetWidth,height:i.offsetHeight};}
  }
  function render(time,enabled,pointer={x:0,y:0}){
    if(disposed)return;
    if(!enabled||lost||!ready||!width||!height){showOriginal(true);return;}
    for(const target of targets){
      const {item,rect,root,sphere,material}=target,selected=item.anchor.classList.contains('hero-selected');
      root.scale.setScalar(rect.height/item.image.naturalHeight*(selected?1.045:1));
      root.position.set(rect.x+rect.width/2+item.x-width/2,height/2-rect.y-rect.height/2-item.y,0);
      root.rotation.set(pointer.y*.035,pointer.x*.045,-item.angle*Math.PI/180);
      sphere.rotation.y=time*Math.PI*2/target.period+.4;
      material.uniforms.emphasis.value=selected?1:0;
    }
    renderer.render(scene,camera);showOriginal(false);
    Object.assign(renderer.domElement.dataset,{drawCalls:String(renderer.info.render.calls),triangles:String(renderer.info.render.triangles),
      art:'chapter-specific-pigments',network:'original-brushwork',rotation:'continuous-360'});
  }
  const onLost=event=>{event.preventDefault();lost=true;showOriginal(true);};
  const onRestored=()=>{lost=false;resize();onRestore();};
  renderer.domElement.addEventListener('webglcontextlost',onLost);renderer.domElement.addEventListener('webglcontextrestored',onRestored);
  showOriginal(true);resize();
  const readyPromise=Promise.all(targets.map(t=>t.item.image.decode())).then(()=>{
    if(disposed)return;
    for(const target of targets){Object.assign(target,createPlanet(target.item.image,target));scene.add(target.root);}
    ready=true;resize();onRestore();
  }).catch(error=>{if(!disposed){showOriginal(true);console.warn('Original planets retained: images unavailable.',error);}});
  return {resize,render,ready:readyPromise,dispose(){
    disposed=true;showOriginal(true);
    renderer.domElement.removeEventListener('webglcontextlost',onLost);renderer.domElement.removeEventListener('webglcontextrestored',onRestored);
    const geometries=new Set(),materials=new Set();scene.traverse(o=>{if(o.geometry)geometries.add(o.geometry);if(o.material)materials.add(o.material);});
    geometries.forEach(g=>g.dispose());materials.forEach(m=>m.dispose());renderer.dispose();renderer.forceContextLoss();renderer.domElement.remove();
  }};
}
