// Local imagegen repairs, composed with the original ink in native SVG.
// No new render loop or WebGL dependency: repairs also work with reduced motion.
let instance = 0;
const ns = 'http://www.w3.org/2000/svg';

export function createRepairs(map, items, ground) {
  const astronaut = items.find(item => item.astronaut)?.image;
  const nodes = [];
  let disposed = false, enabled = true;
  const load = async name => {
    const image = new Image();
    image.src = new URL(`./hero-repairs/${name}.webp`, import.meta.url).href;
    await image.decode();
    return image;
  };
  const render = active => {
    enabled = active;
    for (const {original, svg} of nodes) {
      svg.style.display = active ? '' : 'none';
      original.classList.toggle('hero-art-hidden', active);
    }
  };
  const ready = Promise.all([load('astronaut-hand'), load('ground-filled')]).then(async repairs => {
    if (disposed || !astronaut || !ground) return;
    await Promise.all([astronaut.decode(), ground.decode()]);
    if (disposed) return;
    for (const [index, original] of [astronaut, ground].entries()) {
      const w=original.naturalWidth,h=original.naturalHeight,id=`hero-repair-${++instance}`;
      const svg=document.createElementNS(ns,'svg');
      svg.setAttribute('viewBox',`0 0 ${w} ${h}`);
      svg.setAttribute('aria-hidden','true');
      svg.style.cssText=original.style.cssText;
      svg.style.aspectRatio=`${w} / ${h}`;
      svg.classList.add('hero-art-repair',index===0?'hero-repair-astronaut':'hero-repair-ground');
      if(index===1)svg.classList.add('hero-ground');
      const image = href => `<image href="${href}" width="${w}" height="${h}" preserveAspectRatio="none"/>`;
      if(index===0){
        // Only the palm and cuff window is replaced; helmet, body and boots stay original.
        const patch='<rect x="-10" y="283" width="151" height="110" rx="8"/>';
        svg.innerHTML=`<defs><filter id="${id}-soft"><feGaussianBlur stdDeviation="1.5"/></filter>
          <mask id="${id}-keep" maskUnits="userSpaceOnUse" x="0" y="0" width="${w}" height="${h}"><rect width="${w}" height="${h}" fill="white"/><g fill="black" filter="url(#${id}-soft)">${patch}</g></mask>
          <mask id="${id}-patch" maskUnits="userSpaceOnUse" x="0" y="0" width="${w}" height="${h}"><g fill="white" filter="url(#${id}-soft)">${patch}</g></mask></defs>
          <g mask="url(#${id}-keep)">${image(original.src)}</g><g mask="url(#${id}-patch)">${image(repairs[index].src)}</g>`;
      }else{
        // Repaint only the cutout and a narrow feathered seam around it. This also
        // removes dark matte remnants along the old astronaut-shaped boundary.
        const hole=`<g transform="scale(${w} ${h})"><path d="M.29 0H.73V.26L.69 .34 .58 .37 .57 .50 .49 .64 .42 .64 .42 .45 .36 .36 .27 .40 .24 .35 .24 .21 .31 .18Z" stroke="currentColor" stroke-width=".045" stroke-linejoin="round"/></g>`;
        svg.innerHTML=`<defs><filter id="${id}-soft" x="-20%" y="-20%" width="140%" height="140%"><feGaussianBlur stdDeviation="5"/></filter>
          <mask id="${id}-keep" maskUnits="userSpaceOnUse" x="0" y="0" width="${w}" height="${h}"><rect width="${w}" height="${h}" fill="white"/><g fill="black" color="black" filter="url(#${id}-soft)">${hole}</g></mask>
          <mask id="${id}-patch" maskUnits="userSpaceOnUse" x="0" y="0" width="${w}" height="${h}"><g fill="white" color="white" filter="url(#${id}-soft)">${hole}</g></mask></defs>
          <g mask="url(#${id}-keep)">${image(original.src)}</g><g mask="url(#${id}-patch)">${image(repairs[index].src)}</g>`;
      }
      original.insertAdjacentElement('afterend',svg);
      nodes.push({original,svg});
    }
    render(enabled);
  }).catch(error => {if(!disposed)console.warn('Original central artwork retained: repair unavailable.',error);});
  return {ready,render,dispose(){disposed=true;for(const {original,svg} of nodes){original.classList.remove('hero-art-hidden');svg.remove();}}};
}
