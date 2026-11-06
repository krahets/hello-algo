import * as THREE from './vendor/three/three.module.min.js';

// Art-directed spines in the original 1562 x 1134 composition. The open oval,
// two inward sweeps and bottom title gap are retained; these are 3D curves,
// not a sampled image and not a graph of straight planet-to-planet chords.
const spines = [
  {from:'backtracking', to:'divide_and_conquer', via:['searching'], points:[[59,484,-26],[150,245,-8],[440,92,-42],[581,92,-18]], spread:44},
  {from:'backtracking', to:'greedy', via:['dynamic_programming'], points:[[59,484,-20],[-37,736,-28],[97,946,-28],[378,1072,-24]], spread:46},
  {from:'heap', to:'stack_and_queue', via:['tree','array_and_linkedlist'], points:[[1357,136,-22],[1630,515,14],[1550,965,-40],[1104,1118,-24]], spread:44},
  {from:'graph', to:'tree', points:[[1024,90,-30],[1210,165,-10],[1370,245,-36],[1478,419,-20]], spread:40},
  {from:'sorting', to:'divide_and_conquer', points:[[355,549,-24],[390,370,4],[525,175,-36],[581,92,-18]], spread:44},
  {from:'hashing', to:'tree', points:[[1123,406,-20],[1260,405,-32],[1320,415,6],[1478,419,-22]], spread:34},
  {from:'hashing', to:'array_and_linkedlist', points:[[1123,406,-24],[1280,545,4],[1390,665,-38],[1442,817,-20]], spread:42},
];

export function createFlowLinks(targets) {
  if (!targets.length) return null;
  const positions=[],tangents=[],styles=[],paths=[],fractions=[],bindings=[],motions=[],indices=[];
  const strands=17,segments=72;
  const random = n => {const x=Math.sin(n*127.1+311.7)*43758.5453;return x-Math.floor(x);};

  spines.forEach((definition, route) => {
    const {points:[a,b,c,d]}=definition;
    const routeSeed=701+route*43;
    const spread=definition.spread*(.92+.16*random(routeSeed));
    const mirrored=random(routeSeed+1)>.5;
    const primary=mirrored?2:14,echo=16-primary;
    const brushLanes=[4+Math.floor(random(routeSeed+2)*2),7+Math.floor(random(routeSeed+3)*2),10];
    const dominant=brushLanes[Math.floor(random(routeSeed+4)*brushLanes.length)];
    const fanPhase=random(routeSeed+5)*Math.PI*2;
    const curve=new THREE.CubicBezierCurve3(...[a,b,c,d].map(([x,y,z])=>new THREE.Vector3(x-781,567-y,z)));
    curve.arcLengthDivisions=256;
    const length=curve.getLength();
    // Seed once per route: geometry and timing stay stable on pause / resize.
    const phase=random(routeSeed+6);
    const speed=66+random(routeSeed+7)*38;
    const gap=500+random(routeSeed+8)*300;
    const tailLength=Math.min(42+random(routeSeed+9)*42,length*(.065+.04*random(routeSeed+10)));
    const headLength=3.2+random(routeSeed+11)*2.5;
    for(let lane=0;lane<strands;lane++) {
      const seed=route*strands+lane+1;
      const logicalLane=mirrored?16-lane:lane;
      const brush=brushLanes.includes(logicalLane);
      const rank=(lane-8+(random(seed+31)-.5)*.3)/8;
      const vertices=[];
      for(let j=0;j<=segments;j++) {
        const u=j/segments;
        const point=curve.getPointAt(u),tangent=curve.getTangentAt(u);
        const normal=new THREE.Vector3(-tangent.y,tangent.x,0).normalize();
        // Unequal strand spacing, subtle crossings and tapered bundles give the
        // original brushwork's character without moving an entire bright band.
        const fan=route===5 ? 1 : .88+.10*Math.sin(Math.PI*u+fanPhase);
        const offset=rank*spread*.5*fan + Math.sin((route===5?0:u*Math.PI*2)+seed)*.7;
        point.addScaledVector(normal,offset);
        point.z+=Math.sin(seed*2.4+u*Math.PI)*spread*.2;
        vertices.push(point);
      }
      const distances=[0];
      for(let j=1;j<=segments;j++)distances.push(distances[j-1]+vertices[j].distanceTo(vertices[j-1]));
      const strandLength=distances[segments];
      const offset=positions.length/3;
      for(let j=0;j<=segments;j++) {
        const u=j/segments;
        const direction=vertices[Math.min(segments,j+1)].clone().sub(vertices[Math.max(0,j-1)]).normalize();
        // Broad painted strokes live among hairline bristles, as in the art.
        // Keep the travelling filament narrow even where the painted body widens.
        const baseWidth=lane===primary?1.2+.5*random(routeSeed+12)
          :brush?(logicalLane===dominant?4.1+random(seed+4)*1.0:2.7+random(seed+4)*1.5)
          :.65+random(seed+4)*.7;
        const width=baseWidth*((lane===primary?.92:.78)
          +(lane===primary?.08:.22)*Math.sin(u*(5.+random(seed+6)*4.)+random(seed+7)*Math.PI*2));
        const intensity=lane===primary?.15:brush?.62+random(seed+23)*.12:.40+random(seed+23)*.18;
        // Broad strokes and moving light keep separate tracks even when mirrored.
        const emissive=lane===primary?1.5+.35*random(routeSeed+13):(lane===echo?.18+.08*random(routeSeed+14):0.);
        for(const side of [-1,1]) {
          positions.push(...vertices[j].toArray());tangents.push(...direction.toArray());
          // One shared progress per bundle, measured on each strand's own arc.
          // A rank-dependent head offset made short links look like sideways sweeps.
          paths.push(distances[j],side,strandLength,phase);
          styles.push(width,intensity,length,emissive);
          fractions.push(j/segments,random(seed+54),spread/(strands-1));
          bindings.push(route,u,lane,brush?1:0);
          motions.push(speed,gap,tailLength,headLength);
        }
        if(j<segments){const v=offset+j*2;indices.push(v,v+1,v+2,v+1,v+3,v+2);}
      }
    }
  });
  const geometry=new THREE.BufferGeometry();
  geometry.setAttribute('position',new THREE.Float32BufferAttribute(positions,3));
  geometry.setAttribute('curveTangent',new THREE.Float32BufferAttribute(tangents,3));
  geometry.setAttribute('pathStyle',new THREE.Float32BufferAttribute(paths,4));
  geometry.setAttribute('strandStyle',new THREE.Float32BufferAttribute(styles,4));
  geometry.setAttribute('fraction',new THREE.Float32BufferAttribute(fractions,3));
  geometry.setAttribute('binding',new THREE.Float32BufferAttribute(bindings,4));
  geometry.setAttribute('flowStyle',new THREE.Float32BufferAttribute(motions,4));
  geometry.setIndex(indices);
  const uniforms={
    time:{value:0},unit:{value:1},pixelRatio:{value:1},viewShift:{value:new THREE.Vector2()},
    routeEmphasis:{value:spines.map(()=>0)},selectionActive:{value:0},
    startShift:{value:spines.map(()=>new THREE.Vector3())},
    endShift:{value:spines.map(()=>new THREE.Vector3())},
    teal:{value:new THREE.Color('#479d9d')},
    pearl:{value:new THREE.Color('#def9ef')},
    glow:{value:new THREE.Color('#effffb')},
    blush:{value:new THREE.Color('#d7bab1')},
  };
  const material=new THREE.ShaderMaterial({
    uniforms,transparent:true,depthTest:true,depthWrite:false,side:THREE.DoubleSide,
    vertexShader:`
      attribute vec3 curveTangent;
      attribute vec4 pathStyle, strandStyle;
      attribute vec3 fraction;
      attribute vec4 binding,flowStyle;
      uniform float routeEmphasis[${spines.length}];
      uniform vec3 startShift[${spines.length}],endShift[${spines.length}];
      uniform vec2 viewShift;
      uniform float unit,pixelRatio;
      varying vec4 travel, strand, motion;
      varying vec2 shape, along;
      varying float highlight,filamentOpacity,painted;
      void main(){
        vec3 point=(modelMatrix*vec4(position,1.)).xyz;
        vec3 tangent=(modelMatrix*vec4(curveTangent,0.)).xyz;
        int route=int(binding.x);
        // Emphasize the complete connected bundle, not just pixels near a globe.
        highlight=routeEmphasis[route];
        float u=binding.y;
        float blend=u*u*(3.-2.*u);
        vec3 anchored=mix(startShift[route],endShift[route],blend);
        vec3 anchorSlope=(endShift[route]-startShift[route])*6.*u*(1.-u)/strandStyle.z;
        // Endpoint-only deformation preserves the oval's curvature; local
        // Gaussian attraction to passing planets introduced bends in the spine.
        point+=anchored;
        tangent+=anchorSlope;
        point.xy+=viewShift*point.z*.035;
        tangent.xy+=viewShift*tangent.z*.035;
        vec2 normal=normalize(vec2(-tangent.y,tangent.x));
        float core=max(.28,strandStyle.x*unit*.65)*(1.+.18*highlight);
        float halfWidth=core+max(.9,2.5*unit);
        point.xy+=normal*pathStyle.y*halfWidth;
        travel=pathStyle;strand=strandStyle;motion=flowStyle;painted=binding.w;shape=vec2(core,halfWidth);along=fraction.xy;
        // Fade interleaved strands before their spacing falls below a pixel.
        // Keeping all 17 at low DPR produced diagonal moire between filaments.
        float gap=fraction.z*unit*pixelRatio;
        filamentOpacity=1.;
        if(mod(binding.z,2.)>.5)filamentOpacity*=smoothstep(1.,1.6,gap);
        if(mod(binding.z,4.)>1.5)filamentOpacity*=smoothstep(1.,1.6,gap*2.);
        if(mod(binding.z,8.)>3.5)filamentOpacity*=smoothstep(1.,1.6,gap*4.);
        if(binding.w>.5||strandStyle.w>1.)filamentOpacity=1.;
        gl_Position=projectionMatrix*viewMatrix*vec4(point,1.);
      }`,
    fragmentShader:`
      uniform float time,unit,selectionActive;
      uniform vec3 teal,pearl,glow,blush;
      varying vec4 travel,strand,motion;
      varying vec2 shape,along;
      varying float highlight,filamentOpacity,painted;
      void main(){
        float across=abs(travel.y)*shape.y;
        // Differentiate the signed ribbon coordinate before taking abs. Across
        // the centreline, abs cancels neighbouring pixel derivatives and turns
        // thin filaments into diagonal, braided-looking antialiasing bands.
        float aa=max(fwidth(travel.y)*shape.y,.35);
        float signedAcross=travel.y*shape.y;
        float core=clamp((signedAcross+shape.x)/aa+.5,0.,1.)
          -clamp((signedAcross-shape.x)/aa+.5,0.,1.);
        float halo=exp(-across*across/max(shape.y*shape.y*.32,.01));
        halo*=1.-smoothstep(.75,1.,abs(travel.y));
        // A compact leading glint with a length-scaled filament tail. Speed is
        // in art-space distance, with a seeded cadence for each bundle.
        float cycle=strand.z+motion.y;
        float progress=(mod(time*motion.x+travel.w*cycle,cycle)-150.)/strand.z;
        float behind=progress*travel.z-travel.x;
        float tailLength=motion.z;
        float tail=smoothstep(-3.,2.,behind)*exp(-max(behind,0.)/tailLength)
          *(1.-smoothstep(tailLength*2.,tailLength*3.2,behind));
        float glint=exp(-pow(behind/motion.w,2.));
        float pulse=strand.w*(tail+.65*glint);
        float density=min(1.,unit/.55);
        float brush=painted;
        float notch=abs(along.x-(.18+.64*along.y));
        float dry=smoothstep(.004,.014,notch);
        float quiet=core*strand.y*(.95+.85*highlight)*mix(1.,.12+.88*dry,brush);
        float light=pulse*(core*.90+halo*.38)*(1.+.25*highlight);
        float ends=smoothstep(0.,.035,along.x)*smoothstep(0.,.035,1.-along.x);
        float hoverHalo=halo*.09*highlight*brush;
        float context=1.-.22*selectionActive*(1.-highlight);
        float alpha=(quiet+light+hoverHalo)*density*ends*filamentOpacity*context;
        // A continuous blue-green / pearl ground leaves the brightest white
        // for the travelling edge filament, with no isolated pigment blocks.
        vec3 ink=mix(teal,pearl,.18+.36*along.y);
        ink=mix(ink,blush,smoothstep(.84,.97,along.y)*.55);
        vec3 paint=mix(teal,pearl,.68+.06*sin(along.x*5.+along.y));
        vec3 color=mix(ink,paint,brush);
        color=mix(color,glow,min(.97,pulse*.72+.32*highlight));
        gl_FragColor=vec4(color,min(alpha,.98));
        #include <colorspace_fragment>
      }`,
  });
  const mesh=new THREE.Mesh(geometry,material);
  mesh.name='hero-flow-links';mesh.frustumCulled=false;mesh.renderOrder=-1;
  const byName=new Map(targets.map(target=>[target.name,target]));
  function attach(shift,target,point,scale){
    if(!target){shift.set(0,0,0);return;}
    target.sphere.getWorldPosition(shift);
    shift.z-=target.sphere.scale.x*target.root.scale.x*.15;
    shift.x-=(point[0]-781)*scale+mesh.position.x;
    shift.y-=(567-point[1])*scale+mesh.position.y;
    shift.z-=point[2]*scale;
  }
  return {
    mesh,
    update(time,width,height,pointer={x:0,y:0},pixelRatio=1){
      // Composition box is explicit: no hidden legacy image owns layout.
      const boxHeight=Math.round(height*.78751),boxWidth=Math.round(height*.78751*1562/1134);
      const scale=boxWidth/1562;
      uniforms.time.value=time;uniforms.unit.value=scale;uniforms.pixelRatio.value=pixelRatio;
      uniforms.viewShift.value.set(pointer.x,pointer.y);
      mesh.scale.setScalar(scale);
      mesh.position.set(Math.round(width*.10545)+boxWidth/2-width/2,
        height/2-Math.round(height*.07326)-boxHeight/2,0);
      spines.forEach(({from,to,via=[],points},i)=>{
        attach(uniforms.startShift.value[i],byName.get(from),points[0],scale);
        attach(uniforms.endShift.value[i],byName.get(to),points[3],scale);
        uniforms.routeEmphasis.value[i]=Math.max(...[from,...via,to].map(name=>
          byName.get(name)?.material.uniforms.emphasis.value||0));
      });
      uniforms.selectionActive.value=Math.max(...uniforms.routeEmphasis.value);
    },
    dispose(){mesh.removeFromParent();geometry.dispose();material.dispose();},
  };
}
