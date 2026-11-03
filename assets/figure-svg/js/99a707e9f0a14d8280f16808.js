/* A continuous directional breath over the entire arrow, removable without residue. */
(() => {
  'use strict';
  const NS = 'http://www.w3.org/2000/svg';
  function mount(svg, model) {
    if (svg.reading) return svg.reading;
    const doc = svg.ownerDocument, win = doc.defaultView, config = model.config.motion;
    const sources = new Map([...svg.querySelectorAll('[data-source]')].map(n => [n.dataset.source, n]));
    const abort = new win.AbortController(), signal = abort.signal;
    const media = win.matchMedia('(prefers-reduced-motion: reduce)');
    const originalAttrs = new Map(['tabindex', 'data-reading-root'].map(k => [k, svg.getAttribute(k)]));
    const scope = 'ha-flow-' + Array.from(win.crypto.getRandomValues(new Uint32Array(4)), n => n.toString(16)).join('');
    svg.setAttribute('data-reading-root', scope);
    if (model.arrows.length) svg.setAttribute('tabindex', '0');
    function node(tag, attrs, parent) {
      const n = doc.createElementNS(NS, tag);
      for (const [k, v] of Object.entries(attrs)) n.setAttribute(k, v);
      parent?.append(n); return n;
    }
    const defs = node('defs', {}, svg), decorations = [], tracks = [], issues = [];
    let motion = true, inView = true, disposed = false, raf = 0, previous = null, elapsed = 0, painted = -Infinity;
    const state = () => ({motion, reducedMotion: media.matches, running: !!raf, tracks: tracks.length, issues: [...issues]});
    const dispatch = () => svg.dispatchEvent(new win.CustomEvent('readingchange', {detail: state()}));
    function tint(color) {
      const rgb = color.match(/[\d.]+/g)?.slice(0, 3).map(Number);
      if (!rgb || rgb.length !== 3) throw Error('Unresolved arrow color');
      return `rgb(${rgb.map(c => Math.round(c + (255-c)*config.lightness)).join(',')})`;
    }
    function copyPaint(path) {
      const clone = path.cloneNode(false), css = win.getComputedStyle(path);
      clone.removeAttribute('id');
      for (const property of ['fill','fill-opacity','stroke','stroke-width','stroke-opacity','stroke-dasharray','stroke-dashoffset','stroke-linecap','stroke-linejoin','marker-start','marker-end']) clone.setAttribute(property, css.getPropertyValue(property));
      return clone;
    }
    function markerCarrier(path, end, parent, id) {
      const property = end === 'head' ? 'marker-start' : 'marker-end';
      const url = win.getComputedStyle(path).getPropertyValue(property);
      const ident = url.match(/#([^"')]+)["']?\)/)?.[1];
      const original = ident && svg.querySelector(`#${win.CSS.escape(ident)}`);
      if (!original || original.localName !== 'marker') throw Error('Arrowhead unavailable');
      const marker = original.cloneNode(true);
      marker.id = id;
      const originalPaint = [...original.querySelectorAll('*')], clonedPaint = [...marker.querySelectorAll('*')];
      for (const [i, child] of clonedPaint.entries()) {
        child.removeAttribute('id');
        const css = win.getComputedStyle(originalPaint[i]);
        for (const property of ['fill','stroke']) {
          const color = css.getPropertyValue(property);
          child.setAttribute(property, color === 'none' ? 'none' : tint(color));
        }
      }
      defs.append(marker);
      const carrier = copyPaint(path);
      carrier.setAttribute('fill','none');
      carrier.setAttribute('stroke-opacity','0');
      carrier.setAttribute('marker-start','none');
      carrier.setAttribute('marker-end','none');
      carrier.setAttribute(property,`url(#${id})`);
      parent.append(carrier);
      return carrier;
    }
    function pointAt(t, distance) {
      let lo=0,hi=t.distances.length-1;
      while(hi-lo>1){const mid=(lo+hi)>>1;if(t.distances[mid]<distance)lo=mid;else hi=mid;}
      const f=(distance-t.distances[lo])/(t.distances[hi]-t.distances[lo]||1);
      return {x:t.points[lo].x+(t.points[hi].x-t.points[lo].x)*f,y:t.points[lo].y+(t.points[hi].y-t.points[lo].y)*f};
    }
    function addTrack(path, outline, parent, arrow) {
      const length = path.getTotalLength();
      if (!Number.isFinite(length) || length <= 0) throw Error('Zero-length arrow path');
      const matrix = parent.getCTM(), svgMatrix = svg.getCTM();
      if (!matrix || !svgMatrix) throw Error('Arrow transform unavailable');
      const relative = svgMatrix.inverse().multiply(matrix), count = Math.max(24, Math.ceil(length));
      const points = Array.from({length:count+1}, (_,i) => path.getPointAtLength(length*i/count)), distances = [0];
      for (let i=1;i<points.length;i++) {
        const dx=points[i].x-points[i-1].x,dy=points[i].y-points[i-1].y;
        distances.push(distances.at(-1)+Math.hypot(relative.a*dx+relative.c*dy,relative.b*dx+relative.d*dy));
      }
      const css=win.getComputedStyle(outline), strokeWidth=parseFloat(css.strokeWidth)||1;
      const color=tint(arrow.kind==='block'?css.fill:css.stroke);
      const box=outline.getBBox(), pad=strokeWidth*8+12;
      const bounds={x:box.x-pad,y:box.y-pad,width:box.width+2*pad,height:box.height+2*pad};
      const id=`${scope}-${tracks.length}`, maskId=`${id}-mask`;
      const mask=node('mask',{id:maskId,maskUnits:'userSpaceOnUse',maskContentUnits:'userSpaceOnUse',style:'mask-type:alpha',...bounds},defs);
      const silhouette=copyPaint(outline);
      if(arrow.kind==='path') {silhouette.setAttribute('marker-start','none');silhouette.setAttribute('marker-end','none');}
      mask.append(silhouette);
      const group=node('g',{'pointer-events':'none','aria-hidden':'true',opacity:0,'data-reading-flow':''},parent);
      decorations.push(group);
      const body=node('g',{mask:`url(#${maskId})`},group);
      const t={group,points,distances,length:distances.at(-1),ends:arrow.ends,stops:[],tips:[],kind:arrow.kind};
      if(arrow.kind==='pointer') {
        t.tips.push(node('rect',{...bounds,fill:color,stroke:'none'},body));
      } else {
        // Fixed full-length segments interpolate one broad wave in arc-length
        // space. All geometry is cached at mount; frames only update opacity.
        const first=points[0],last=points.at(-1),dx=last.x-first.x,dy=last.y-first.y;
        const chord=Math.hypot(dx,dy);
        const straight=chord>0 && points.every(p=>Math.abs(dx*(p.y-first.y)-dy*(p.x-first.x))/chord<.01) && Math.abs(length-chord)<.01;
        // Straight shafts and filled arrows use one gradient, avoiding alpha
        // seams across a wide silhouette. Curves use local arc-length gradients.
        const segments=straight?1:16, steps=straight?16:1;
        for(let i=0;i<segments;i++) {
          const a=pointAt(t,t.length*i/segments),b=pointAt(t,t.length*(i+1)/segments);
          const gradient=node('linearGradient',{id:`${id}-g${i}`,gradientUnits:'userSpaceOnUse',x1:a.x,y1:a.y,x2:b.x,y2:b.y},defs);
          for(let j=0;j<=steps;j++) {
            const offset=j/steps;
            const s=(i+offset)/segments;
            const u=arrow.ends.length===2?Math.abs(2*s-1):arrow.ends[0]==='head'?1-s:s;
            const stop=node('stop',{offset,'stop-color':color,'stop-opacity':0},gradient);
            t.stops.push({stop,u});
          }
          const samples=Math.max(2,Math.ceil(length/segments));
          const d=Array.from({length:samples+1},(_,j)=>{
            const p=pointAt(t,t.length*(i+j/samples)/segments);
            return (j?'L':'M')+p.x.toFixed(3)+' '+p.y.toFixed(3);
          }).join(' ');
          node('path',{d,fill:'none',stroke:`url(#${id}-g${i})`,'stroke-width':arrow.kind==='block'?Math.hypot(box.width,box.height)*2:strokeWidth*2,'stroke-linecap':'butt','stroke-linejoin':'round','marker-start':'none','marker-end':'none'},body);
        }
        if(arrow.kind==='path') for(const end of arrow.ends) t.tips.push(markerCarrier(outline,end,group,`${id}-${end}`));
      }
      tracks.push(t);
    }
    for (const arrow of model.arrows) {
      const owner=sources.get(arrow.object);
      if (!owner) {issues.push(`Missing arrow owner: ${arrow.object}`);continue;}
      try {
        if (arrow.kind==='block') {
          const outline=owner.querySelector('path');
          if (!outline) throw Error('Block silhouette unavailable');
          const [[x,y],[xx,yy]]=arrow.track;
          const path=node('path',{d:`M ${x} ${y} L ${xx} ${yy}`,visibility:'hidden','pointer-events':'none'},outline.parentNode);
          decorations.push(path);addTrack(path,outline,outline.parentNode,arrow);
        } else {
          const paths=[...owner.querySelectorAll('path')].filter(p=>{
            const css=win.getComputedStyle(p);
            return arrow.ends.some(e=>(e==='head'?css.markerStart:css.markerEnd)!=='none');
          });
          if(paths.length!==1) throw Error(`Expected one directional path, found ${paths.length}`);
          addTrack(paths[0],paths[0],paths[0].parentNode,arrow);
        }
      } catch(error) {issues.push(`${arrow.object}: ${error.message}`);}
    }
    function wave(u) {
      const oscillation=(1+Math.cos(2*Math.PI*(config.cycles*u-elapsed/config.period)))/2;
      return config.opacity_min+(config.opacity_max-config.opacity_min)*Math.pow(oscillation,config.crest_power||1);
    }
    function paint() {
      for(const t of tracks) {
        t.group.setAttribute('opacity','1');
        t.group.dataset.flowPhase=String(elapsed/config.period%1);
        for(const {stop,u} of t.stops) stop.setAttribute('stop-opacity',wave(u).toFixed(4));
        for(const tip of t.tips) tip.setAttribute('opacity',wave(1).toFixed(4));
      }
    }
    const canRun = () => !disposed && motion && !media.matches && inView && !doc.hidden && tracks.length;
    function tick(now) {
      raf=0;
      // Cancellation cannot revoke a callback already delivered by the browser.
      // Recheck at frame entry so visibility/preference changes cannot revive it.
      if(!canRun()){schedule();return;}
      if(previous!=null)elapsed+=Math.min(.1,(now-previous)/1000);
      previous=now;const interval=1000/config.fps;
      if(now-painted>=interval){paint();painted=Number.isFinite(painted)?now-(now-painted)%interval:now;}
      raf=win.requestAnimationFrame(tick);
    }
    function schedule() {
      const running=canRun();
      if(running&&!raf)raf=win.requestAnimationFrame(tick);
      if(!running){win.cancelAnimationFrame(raf);raf=0;previous=null;tracks.forEach(t=>t.group.setAttribute('opacity','0'));}
    }
    svg.addEventListener('keydown',e=>{if(e.key===' '){motion=!motion;schedule();dispatch();e.preventDefault();}},{signal});
    const observer=new win.IntersectionObserver(entries=>{inView=entries[0].isIntersecting;schedule();});observer.observe(svg);
    doc.addEventListener('visibilitychange',schedule,{signal});
    win.addEventListener('pagehide',()=>{inView=false;schedule();},{signal});
    win.addEventListener('pageshow',()=>{inView=true;schedule();},{signal});
    media.addEventListener('change',()=>{schedule();dispatch();},{signal});
    svg.reading={
      state,model,
      configure(options){if(options.motion!=null)motion=!!options.motion;schedule();dispatch();},
      destroy(){if(disposed)return;disposed=true;abort.abort();observer.disconnect();schedule();decorations.forEach(n=>n.remove());defs.remove();for(const[k,v]of originalAttrs)v==null?svg.removeAttribute(k):svg.setAttribute(k,v);delete svg.reading;},
    };
    schedule();return svg.reading;
  }
  globalThis.HelloAlgoReading={mount};
})();
