import * as THREE from "./vendor/three/three.module.min.js";
import { planets, createPlanet, loadPlanetPaint, disposePlanetPaint } from "./hero-surfaces.js";

// The illustration supplies composition; each globe is independently lit and rotates fully.
export function createPlanets(map, items, onRestore, restoreImage = () => {}) {
  const targets=planets.map(d=>({...d,item:items.find(i=>i.image.dataset.heroAsset === 'chapter_'+d.name)})).filter(d=>d.item);
  const hero=map.closest('.home-div');
  const renderer=new THREE.WebGLRenderer({alpha:true,antialias:true,powerPreference:'low-power'});
  renderer.setClearColor(0x000000,0);renderer.domElement.className='hero-objects-canvas';
  renderer.domElement.setAttribute('aria-hidden','true');
  renderer.debug.onShaderError=(gl,program,vertex,fragment)=>{throw new Error(`Hero shader: ${gl.getShaderInfoLog(vertex)} ${gl.getShaderInfoLog(fragment)}`);};
  const scene=new THREE.Scene(),camera=new THREE.OrthographicCamera(-1,1,1,-1,.1,5000);
  camera.position.z=2000;
  map.insertBefore(renderer.domElement,map.querySelector(':scope > a'));
  let width=0,height=0,lost=false,disposed=false,ready=false,lastTime=0,startTime=null;
  const showOriginal=(show,load=false)=>{
    if(load)targets.forEach(({item})=>restoreImage(item.image));
    renderer.domElement.hidden=show;hero.classList.toggle('hero-three-active',!show);
    targets.forEach(({item})=>item.image.classList.toggle('hero-replaced',!show));
  };
  function resize(){
    width=map.clientWidth;height=map.clientHeight;
    renderer.setPixelRatio(Math.min(devicePixelRatio||1,2));
    renderer.setSize(Math.max(width,1),Math.max(height,1),false);
    camera.left=-width/2;camera.right=width/2;camera.top=height/2;camera.bottom=-height/2;camera.updateProjectionMatrix();
    for(const target of targets){const i=target.item.image;target.rect={x:i.offsetLeft,y:i.offsetTop,width:i.offsetWidth,height:i.offsetHeight};
    }
  }
  function render(time,enabled,pointer={x:0,y:0}){
    if(disposed)return;
    if(!enabled||lost||!ready||!width||!height){showOriginal(true,!enabled||lost);return;}
    if(startTime===null)startTime=time;
    const emphasisBlend=time===lastTime?1:1-Math.exp(-Math.min(.1,Math.abs(time-lastTime))*10);lastTime=time;
    for(const target of targets){
      const {item,rect,root,sphere,material}=target,selected=item.anchor.classList.contains('hero-selected');
      root.scale.setScalar(rect.height/Number(item.image.dataset.sourceHeight || item.image.naturalHeight));
      root.position.set(rect.x+rect.width/2+item.x-width/2,height/2-rect.y-rect.height/2-item.y,0);
      root.rotation.set(pointer.y*.035,pointer.x*.045,-item.angle*Math.PI/180);
      sphere.rotation.y=(time-startTime)*Math.PI*2/target.period;
      if(target.moon)target.moon.rotation.y=sphere.rotation.y*2;
      material.uniforms.emphasis.value+=((selected?1:0)-material.uniforms.emphasis.value)*emphasisBlend;
    }
    renderer.render(scene,camera);showOriginal(false);
    Object.assign(renderer.domElement.dataset,{drawCalls:String(renderer.info.render.calls),triangles:String(renderer.info.render.triangles),
      art:'reference-authored-albedo',network:'original-brushwork',rotation:'continuous-360'});
  }
  const onLost=event=>{event.preventDefault();lost=true;showOriginal(true,true);};
  const onRestored=()=>{lost=false;resize();onRestore();};
  renderer.domElement.addEventListener('webglcontextlost',onLost);renderer.domElement.addEventListener('webglcontextrestored',onRestored);
  showOriginal(true);resize();
  const readyPromise=Promise.allSettled(targets.map(async t=>{const map=await loadPlanetPaint(t);if(disposed){disposePlanetPaint(map);return;}t.paintMap=map;})).then(results=>{
    const failure=results.find(r=>r.status==='rejected');if(failure)throw failure.reason;
    if(disposed)return;
    for(const target of targets){Object.assign(target,createPlanet(target.item.image,target,target.paintMap));scene.add(target.root);}
    ready=true;resize();onRestore();
  }).catch(error=>{if(!disposed){targets.forEach(t=>{disposePlanetPaint(t.paintMap);t.paintMap=null;});showOriginal(true,true);console.warn('Original planets retained: paint unavailable.',error);}});
  return {resize,render,ready:readyPromise,dispose(){
    disposed=true;showOriginal(true,true);
    renderer.domElement.removeEventListener('webglcontextlost',onLost);renderer.domElement.removeEventListener('webglcontextrestored',onRestored);
    const geometries=new Set(),materials=new Set();scene.traverse(o=>{if(o.geometry)geometries.add(o.geometry);if(o.material)materials.add(o.material);});
    geometries.forEach(g=>g.dispose());materials.forEach(m=>m.dispose());targets.forEach(t=>disposePlanetPaint(t.paintMap));renderer.dispose();renderer.forceContextLoss();renderer.domElement.remove();
  }};
}
