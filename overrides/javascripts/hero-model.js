/* Authored, complete geometry. Units are local to the seated astronaut. */
import * as T from './vendor/three/three.module.min.js';

export function surface(color, grain = 0.025) {
  return new T.ShaderMaterial({
    uniforms: { ink: { value: new T.Color(color) }, grain: { value: grain } },
    vertexShader: `varying vec3 n; varying vec3 p;
      void main(){n=normalize(normalMatrix*normal);p=position;
      gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}`,
    fragmentShader: `varying vec3 n; varying vec3 p; uniform vec3 ink; uniform float grain;
      void main(){vec3 normal=normalize(n);float l=dot(normal,normalize(vec3(-.6,.9,1.5)));
      float s=.23+.24*smoothstep(-.08,.02,l)+.30*smoothstep(.39,.46,l)+.23*smoothstep(.78,.85,l);
      float paper=sin(p.x*81.+sin(p.y*43.))*sin(p.z*59.+p.y*93.);
      vec3 c=ink*s+vec3(.025,.028,.045)*(1.-s);
      float cloth=sin(p.y*16.+sin(p.x*9.+p.z*5.)*1.8);
      float hatch=smoothstep(.78,.98,cloth)*smoothstep(-.3,.4,sin(p.x*11.-p.z*7.));
      c*=1.+paper*.012-hatch*grain;
      c=mix(c,vec3(.015,.045,.065),.65*(1.-smoothstep(.02,.16,abs(normal.z))));
      gl_FragColor=vec4(c,1.);
      #include <tonemapping_fragment>
      #include <colorspace_fragment>
      }`,
  });
}
const v = p => new T.Vector3(...p);
export function mesh(group, geometry, material, position = [0,0,0], scale = [1,1,1]) {
  const m = new T.Mesh(geometry, material);
  m.position.set(...position); m.scale.set(...scale); group.add(m); return m;
}
export function ball(g,m,p,s) { return mesh(g,new T.SphereGeometry(1,32,24),m,p,s); }
export function tube(g,m,points,r=.025,segments=40) {
  return mesh(g,new T.TubeGeometry(new T.CatmullRomCurve3(points.map(v)),segments,r,8,false),m);
}
export function limb(g,m,a,b,r1,r2=r1) {
  const delta=v(b).sub(v(a)), length=delta.length();
  // One closed, subtly gathered pressure-suit sleeve, rather than intersecting caps.
  const rows=48, columns=32, positions=[], indices=[];
  for(let j=0;j<=rows;j++) {
    const y=-r1+(length+r1+r2)*j/rows,t=T.MathUtils.clamp(y/length,0,1);
    const radius=y<0?Math.sqrt(Math.max(0,r1*r1-y*y)):
      y>length?Math.sqrt(Math.max(0,r2*r2-(y-length)**2)):r1+(r2-r1)*t;
    for(let i=0;i<=columns;i++) {
      const angle=i/columns*Math.PI*2;
      const fold=y>0&&y<length?1+.05*Math.sin(t*27.+Math.sin(angle*2)*1.5)*Math.sin(t*Math.PI):1;
      positions.push(Math.cos(angle)*radius*fold,y,Math.sin(angle)*radius*fold);
    }
  }
  for(let j=0;j<rows;j++)for(let i=0;i<columns;i++){
    const a=j*(columns+1)+i,b=a+columns+1;indices.push(a,a+1,b,a+1,b+1,b);
  }
  const geometry=new T.BufferGeometry();geometry.setAttribute('position',new T.Float32BufferAttribute(positions,3));geometry.setIndex(indices);geometry.computeVertexNormals();
  const o=mesh(g,geometry,m,a);o.quaternion.setFromUnitVectors(new T.Vector3(0,1,0),delta.normalize());return o;
}
export function ring(g,m,r,t,p=[0,0,0],rx=0,ry=0,rz=0,arc=Math.PI*2) {
  const o=mesh(g,new T.TorusGeometry(r,t,8,r<.3?32:r<.8?64:96,arc),m,p);o.rotation.set(rx,ry,rz);return o;
}
export function box(g,m,p,s,r=.04) {
  // Rounded cuboids retain broad planar faces without a dependency on addons.
  const shape=new T.Shape();const w=s[0]/2,h=s[1]/2; r=Math.min(r,w,h);
  shape.moveTo(-w+r,-h);shape.lineTo(w-r,-h);shape.quadraticCurveTo(w,-h,w,-h+r);
  shape.lineTo(w,h-r);shape.quadraticCurveTo(w,h,w-r,h);shape.lineTo(-w+r,h);
  shape.quadraticCurveTo(-w,h,-w,h-r);shape.lineTo(-w,-h+r);shape.quadraticCurveTo(-w,-h,-w+r,-h);
  const geom=new T.ExtrudeGeometry(shape,{depth:s[2]-r*2,bevelEnabled:true,bevelSize:r/2,bevelThickness:r,bevelSegments:2,steps:1,curveSegments:4});
  geom.translate(0,0,-s[2]/2+r);return mesh(g,geom,m,p);
}
// Batch static parts per material, in group-local coordinates. Animated groups stay separate.
export function batch(group) {
  group.updateMatrixWorld(true);
  const inverse=group.matrixWorld.clone().invert(), buckets=new Map();
  group.traverse(o=>{
    if(!o.isMesh)return;
    const geometry=o.geometry.index?o.geometry.toNonIndexed():o.geometry.clone();
    geometry.applyMatrix4(new T.Matrix4().multiplyMatrices(inverse,o.matrixWorld));
    if(!buckets.has(o.material))buckets.set(o.material,[]);
    buckets.get(o.material).push(geometry);
  });
  const oldGeometries=new Set();group.traverse(o=>{if(o.geometry)oldGeometries.add(o.geometry);});
  group.clear();oldGeometries.forEach(g=>g.dispose());
  buckets.forEach((geometries,material)=>{
    const merged=new T.BufferGeometry();
    for(const name of ['position','normal']) {
      const length=geometries.reduce((n,g)=>n+g.attributes[name].array.length,0);
      const data=new Float32Array(length);let offset=0;
      geometries.forEach(g=>{data.set(g.attributes[name].array,offset);offset+=g.attributes[name].array.length;});
      merged.setAttribute(name,new T.BufferAttribute(data,3));
    }
    mesh(group,merged,material);geometries.forEach(g=>g.dispose());
  });
}

export function createAstronaut() {
  const root=new T.Group(), body=new T.Group(), helmet=new T.Group(), legs=new T.Group();
  const teal=surface('#368f91', .21), dark=surface('#123e51'), seam=surface('#82b9a1');
  const cream=surface('#e8d5a2'), gold=surface('#e9ac3c'), black=surface('#192b3d');
  const silver=surface('#889b98'), shadow=surface('#243943'), warm=surface('#a27c4d');
  root.add(legs,body);body.add(helmet);
  // Complete pressure suit, backpack and belt, including unseen back surfaces.
  box(body,cream,[0,1.85,-.45],[1.05,1.35,.44],.10);
  box(body,shadow,[0,1.85,-.70],[.80,1.08,.08],.04);
  for(let i=0;i<9;i++)box(body,silver,[0,1.55+i*.075,-.76],[.53,.025,.025],.006);
  ball(body,teal,[0,1.63,0],[.61,.86,.40]);
  ball(legs,dark,[0,.83,0],[.65,.40,.40]);
  ball(legs,teal,[0,.46,.02],[.62,.31,.45]);
  ring(body,cream,.47,.035,[0,1.05,0],Math.PI/2);
  ring(body,shadow,.50,.065,[0,1.12,0],Math.PI/2);
  // Neck seals and a separate, very slightly responsive helmet.
  for(let i=0;i<4;i++)ring(body,i%2?cream:dark,.39+i*.018,.038,[0,2.29+i*.055,0],Math.PI/2);
  helmet.position.set(0,2.93,0);
  ball(helmet,gold,[0,.12,-.04],[.76,.77,.69]);
  // Visor and gasket are concentric surface patches: no intersecting ellipsoid edges.
  function visorPatch(radius, material, lift) {
    const positions=[], indices=[];const rows=28, columns=96;
    const point=(r,a)=>{
      const x=Math.sin(r*1.10)*Math.cos(a), y=Math.sin(r*.96)*Math.sin(a);
      const z=Math.sqrt(Math.max(0,1-x*x-y*y));
      return new T.Vector3(x*.76,y*.77,z*.69).applyAxisAngle(new T.Vector3(1,0,0),.18).multiplyScalar(1+lift).add(new T.Vector3(0,.12,-.04));
    };
    for(let j=0;j<=rows;j++)for(let i=0;i<=columns;i++)positions.push(...point(j/rows*radius,i/columns*Math.PI*2).toArray());
    for(let j=0;j<rows;j++)for(let i=0;i<columns;i++){
      const a=j*(columns+1)+i,b=a+columns+1;indices.push(a,b,a+1,b,b+1,a+1);
    }
    const geometry=new T.BufferGeometry();geometry.setAttribute('position',new T.Float32BufferAttribute(positions,3));geometry.setIndex(indices);geometry.computeVertexNormals();
    // The winding follows the outward face, including the center fan.
    mesh(helmet,geometry,material);
    return point;
  }
  visorPatch(1.045,cream,.015);visorPatch(1.005,dark,.022);
  const visorPoint=visorPatch(.953,black,.030);
  const reflection=[];for(let i=0;i<16;i++)reflection.push(visorPoint(.80,2.65+i*.045).toArray());
  tube(helmet,seam,reflection,.018);
  const reflection2=[];for(let i=0;i<12;i++)reflection2.push(visorPoint(.82,5.65+i*.035).toArray());
  tube(helmet,teal,reflection2,.012);
  tube(helmet,cream,[[-.54,.60,.32],[-.35,.77,.27],[-.10,.84,.18],[.13,.83,.13]],.025);
  // Ear ports sit on both sides and carry real concentric rims.
  for(const sign of [-1,1]) {
    ball(helmet,dark,[sign*.70,.02,0],[.105,.27,.27]);
    const port=mesh(helmet,new T.CylinderGeometry(.22,.22,.12,32),cream,[sign*.76,.02,0]);port.rotation.z=Math.PI/2;
    const cap=mesh(helmet,new T.CylinderGeometry(.17,.17,.125,32),shadow,[sign*.78,.02,0]);cap.rotation.z=Math.PI/2;
    ring(helmet,silver,.12,.018,[sign*.85,.02,0],0,Math.PI/2);
  }
  // Shoulder to palm: left arm supports the entire glass from below.
  limb(body,teal,[-.47,2.10,0],[-.91,1.65,.13],.27,.23);
  limb(body,teal,[-.91,1.65,.13],[-1.40,1.60,.30],.23,.17);
  const leftCuff=mesh(body,new T.CylinderGeometry(.193,.193,.20,40),cream,[-1.37,1.60,.30]);leftCuff.rotation.z=Math.PI/2;
  ball(body,teal,[-1.58,1.58,.34],[.29,.10,.21]);
  // Four articulated fingers and a thumb, with separate cream knuckle pads.
  for(let i=0;i<4;i++) {
    const z=.16+i*.112;
    tube(body,dark,[[-1.58,1.56,z],[-1.77,1.56,z],[-1.85,1.62,z],[-1.84,1.69,z]],.048,16);
    tube(body,teal,[[-1.58,1.58,z],[-1.76,1.58,z],[-1.82,1.64,z]],.038,16);
    ball(body,cream,[-1.76,1.60,z],[.052,.022,.032]);
  }
  tube(body,teal,[[-1.42,1.58,.48],[-1.51,1.65,.57],[-1.64,1.68,.56]],.065,20);
  // Right arm rests on the raised knee.
  limb(body,teal,[.49,2.10,0],[.84,1.48,.21],.28,.25);
  limb(body,teal,[.84,1.48,.21],[.71,.92,.66],.25,.18);
  const rightCuff=mesh(body,new T.CylinderGeometry(.205,.205,.19,40),cream,[.73,.98,.62]);rightCuff.quaternion.setFromUnitVectors(new T.Vector3(0,1,0),new T.Vector3(.06,.14,-.11).normalize());
  ball(body,dark,[.67,.78,.76],[.22,.25,.12]);
  box(body,cream,[.67,.86,.86],[.30,.21,.06],.045);
  box(body,teal,[.67,.87,.90],[.22,.12,.025],.025);
  for(let i=0;i<4;i++) {
    const x=.51+i*.10;
    tube(body,teal,[[x,.79,.82],[x-.015,.61,.91],[x-.04,.53,.88]],.046,16);
    ball(body,cream,[x,.67,.925],[.03,.055,.015]);
  }
  tube(body,teal,[[.46,.82,.77],[.37,.72,.85],[.38,.62,.87]],.06,16);
  // Crossed legs: two continuous chains, with one shin clearly in front.
  limb(legs,teal,[-.30,.85,0],[-.83,.83,.48],.34,.36);
  limb(legs,teal,[-.83,.83,.48],[.18,.43,1.02],.30,.22);
  limb(legs,teal,[.30,.83,0],[.87,.58,.44],.34,.36);
  limb(legs,teal,[.87,.58,.44],[-.57,.38,.75],.28,.21);
  const bootA=new T.Group();bootA.position.set(.27,.39,1.12);bootA.rotation.set(-.20, -.45,-.35);legs.add(bootA);
  ball(bootA,dark,[0,0,0],[.28,.24,.46]);ball(bootA,teal,[0,.09,0],[.26,.20,.39]);
  box(bootA,cream,[0,.01,.31],[.49,.15,.08],.04);
  box(bootA,shadow,[0,-.15,0],[.52,.11,.77],.045);
  for(let i=0;i<6;i++)box(bootA,silver,[0,-.205,-.28+i*.105],[.42,.018,.025],.006);
  ball(legs,dark,[-.72,.36,.80],[.38,.21,.25]);
  ball(legs,teal,[-.76,.42,.83],[.30,.17,.23]);
  ring(legs,cream,.205,.023,[-.52,.39,.79],0,Math.PI/2);
  // Garment seams and interrupted wrinkle bands, aligned to each limb.
  for(let i=0;i<6;i++) {
    const t=i/6;
    tube(legs,i%2?seam:dark,[[-.80+t*.82,.92-t*.49,.70+t*.29],[-.64+t*.82,.91-t*.49,.84+t*.20],[-.48+t*.82,.79-t*.49,.86+t*.22]],.022,16);
  }
  for(let i=0;i<5;i++) {
    const t=i/5;
    tube(legs,dark,[[.38+t*.30,.96-t*.13,.22],[.65+t*.28,.91-t*.13,.45],[.80+t*.10,.72-t*.10,.65]],.025,20);
    tube(legs,seam,[[.43+t*.30,.98-t*.13,.25],[.66+t*.27,.93-t*.13,.44]],.014,20);
  }
  for(let i=0;i<3;i++) {
    const strap=box(bootA,i%2?cream:silver,[0,.19,-.17+i*.16],[.43,.04,.065],.01);strap.rotation.x=-.12;
  }
  tube(body,cream,[[-.52,2.26,.16],[-.66,2.17,.23],[-.72,2.02,.24]],.023);
  tube(body,seam,[[.47,2.27,.18],[.67,2.16,.22],[.73,2.03,.26]],.023);
  tube(body,dark,[[-.22,1.28,.38],[0,1.22,.40],[.25,1.29,.38]],.028);
  tube(body,seam,[[-.24,1.32,.39],[0,1.27,.42],[.25,1.34,.39]],.015);
  // Harness, chest instrument and complete hoses to the backpack.
  for(const sign of [-1,1]) {
    tube(body,shadow,[[sign*.43,2.20,.12],[sign*.38,1.93,.37],[sign*.33,1.24,.35]],.065);
    tube(body,cream,[[sign*.43,2.22,.14],[sign*.38,1.93,.43],[sign*.33,1.24,.41]],.024);
  }
  box(body,cream,[0,1.78,.43],[.81,.62,.19],.045);
  box(body,shadow,[0,1.78,.55],[.73,.54,.10],.025);
  box(body,silver,[-.15,1.88,.615],[.31,.20,.045],.015);
  box(body,black,[-.15,1.89,.645],[.23,.12,.025],.012);
  for(let i=0;i<3;i++)box(body,i===1?teal:gold,[.20,1.94-i*.15,.63],[.10,.09,.045],.012);
  box(body,silver,[-.15,1.65,.62],[.28,.10,.035],.01);
  for(const x of [-.32,.32])for(const y of [1.56,2.0])ball(body,cream,[x,y,.62],[.019,.019,.013]);
  const hose=[[-.36,1.65,.45],[-.56,1.37,.47],[-.39,1.10,.51],[.12,1.01,.46],[.50,1.30,.25],[.55,1.65,-.45]];
  tube(body,dark,hose,.072);tube(body,cream,hose,.05);
  const hoseCurve=new T.CatmullRomCurve3(hose.map(v));
  for(let i=0;i<42;i++) {
    const p=hoseCurve.getPoint(i/41), d=hoseCurve.getTangent(i/41);
    const rib=ring(body,warm,.056,.012,p.toArray());rib.quaternion.setFromUnitVectors(new T.Vector3(0,0,1),d);
  }
  tube(body,cream,[[.74,2.95,-.14],[.97,2.78,-.25],[.98,2.40,-.44],[.61,2.10,-.58]],.065);
  // Mission badge, side pocket and a fully modeled underside complete the silhouette.
  box(body,cream,[.66,2.04,.22],[.28,.20,.08],.025).rotation.z=-.28;
  ring(body,dark,.055,.019,[.67,2.04,.27]);
  batch(helmet);
  body.remove(helmet);batch(body);body.add(helmet);batch(legs);
  return { root,body,helmet, palm:new T.Vector3(-1.59,1.69,.34), materials:{cream,gold,dark,teal,black} };
}

export function createPlatform() {
  const root=new T.Group();const sand=surface('#c3b27d'), light=surface('#e3d2a0');
  const edge=surface('#82765b'), ink=surface('#415458'), gold=surface('#b8a070');
  const points=[[0,-.13],[1.76,-.13],[1.92,-.08],[1.96,.02],[1.91,.10],[1.77,.15],[0,.15]].map(p=>new T.Vector2(...p));
  mesh(root,new T.LatheGeometry(points,128),sand);
  for(const [r,y,t,m] of [[1.91,.04,.028,light],[1.82,-.10,.022,edge],[1.71,.155,.012,gold],[1.50,.158,.008,ink],[.98,.158,.009,gold]])ring(root,m,r,t,[0,y,0],Math.PI/2);
  // Contact shadow sits on a closed top, never an astronaut-shaped cutout.
  const shadow=new T.MeshBasicMaterial({color:'#183b40',transparent:true,opacity:.30,depthWrite:false});
  const contact=mesh(root,new T.CircleGeometry(1,64),shadow,[0,.164,.25],[.95,.66,1]);contact.rotation.x=-Math.PI/2;
  for(let i=0;i<6;i++)ring(root,i%2?ink:gold,2.10+i*.095,.009,[0,-.04-i*.012,0],Math.PI/2,0,i*.9,Math.PI*(1.35+i*.07));
  let seed=312;const rnd=()=>{seed=(1664525*seed+1013904223)>>>0;return seed/4294967296;};
  for(let i=0;i<30;i++) {
    const a=rnd()*Math.PI*2,r=1.34+rnd()*.95,s=.025+rnd()*.075;
    const rock=mesh(root,new T.DodecahedronGeometry(s,0),i%3?light:edge,[Math.cos(a)*r,.14+ (r<1.85?s*.4:-.10),Math.sin(a)*r],[1.4,.65,1]);rock.rotation.set(rnd(),rnd(),rnd());
  }
  batch(root);return root;
}

export function createHourglass(materials) {
  const root=new T.Group(),frame=new T.Group(),sand=new T.Group();root.add(frame);frame.add(sand);
  const {cream,gold,dark}=materials;
  const glass=new T.MeshBasicMaterial({color:'#94d9d0',transparent:true,opacity:.14,side:T.DoubleSide,depthWrite:false});
  const profile=[[.032,0],[.047,.05],[.10,.13],[.17,.25],[.19,.33],[.19,.36]].map(p=>new T.Vector2(...p));
  for(const sign of [-1,1]) {
    const bulb=mesh(frame,new T.LatheGeometry(profile,40),glass);bulb.scale.y=sign;
    mesh(frame,new T.CylinderGeometry(.235,.235,.055,48),cream,[0,sign*.39,0]);
    mesh(frame,new T.CylinderGeometry(.207,.207,.02,48),dark,[0,sign*.357,0]);
    ring(frame,gold,.228,.013,[0,sign*.417,0],Math.PI/2);
    for(const a of [.3,2.5])tube(frame,cream,[[Math.cos(a)*.18,sign*.33,Math.sin(a)*.18],[Math.cos(a)*.13,sign*.19,Math.sin(a)*.13],[Math.cos(a)*.045,sign*.05,Math.sin(a)*.045]],.006,16);
  }
  const cone=new T.ConeGeometry(1,1,40),upper=mesh(sand,cone,gold),lower=mesh(sand,cone,gold);
  upper.rotation.z=Math.PI;
  const stream=mesh(sand,new T.CylinderGeometry(.008,.008,1,8),gold);
  const grain=mesh(sand,new T.SphereGeometry(.013,8,6),cream);
  function update(time) {
    const cycle=Math.floor(time/14), phase=time%14,p=Math.min(phase/11,1);
    const f=T.MathUtils.smoothstep(phase,11.6,13.2);
    frame.rotation.z=(cycle+f)*Math.PI;sand.rotation.z=cycle*Math.PI;
    const h=.32*Math.cbrt(1-p),l=.32*Math.cbrt(p);
    upper.scale.set(.185*h/.32,Math.max(h,.0001),.185*h/.32);upper.position.y=h/2;
    lower.scale.set(.185*l/.32,Math.max(l,.0001),.185*l/.32);lower.position.y=-.32+l/2;
    upper.visible=p<1;lower.visible=p>0;stream.visible=grain.visible=phase<11;
    const gap=Math.max(.32-l,.005);stream.scale.y=gap;stream.position.y=-gap/2;
    grain.position.y=-(time*1.6%gap);
    root.position.y=.42+Math.sin(f*Math.PI)*.14;
  }
  update(0);return {root,update};
}
