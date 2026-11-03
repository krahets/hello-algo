// A layered vector illustration; no physics engine or independent animation loop.
export const HOURGLASS_CYCLE_SECONDS = 28;
let instance = 0;
export function createHourglass(items) {
  const item = items.find(item => item.image.dataset.heroAsset === "chapter_computational_complexity");
  if (!item) return null;
  const id = `hero-sand-${++instance}`;
  const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  svg.setAttribute("viewBox", "0 0 113 178");
  svg.setAttribute("aria-hidden", "true");
  svg.classList.add("hero-hourglass");
  svg.style.cssText = item.image.style.cssText;
  svg.innerHTML = `
    <defs>
      <clipPath id="${id}-top"><path d="M16 25 Q21 62 56.5 85 Q92 62 97 25Z"/></clipPath>
      <clipPath id="${id}-bottom"><path d="M56.5 93 Q22 116 16 153 Q56 167 97 153 Q91 116 56.5 93Z"/></clipPath>
      <linearGradient id="${id}-glass" x1="0" x2="1"><stop stop-color="#193d4b"/><stop offset=".5" stop-color="#204e5d"/><stop offset="1" stop-color="#102b3c"/></linearGradient>
      <linearGradient id="${id}-sand" x1="0" y1="0" x2="1" y2=".5"><stop stop-color="#fae6a3"/><stop offset=".5" stop-color="#d8c37d"/><stop offset="1" stop-color="#b89b65"/></linearGradient>
    </defs>
    <g class="hourglass-body">
      <path d="M9 19 C12 56 30 77 52 89 C28 105 13 128 9 157 Q56 177 104 157 C100 126 84 103 61 89 C86 73 100 49 104 19Z" fill="url(#${id}-glass)" stroke="#d8d39d" stroke-width="5"/>
      <path d="M15 26 C24 65 41 77 56 85 C78 69 91 49 97 26 M56 94 C34 113 23 132 16 153 M63 95 C84 118 91 138 97 152" fill="none" stroke="#5c9c9d" stroke-width="3"/>
      <g class="hourglass-sand">
      <g clip-path="url(#${id}-top)"><path class="hourglass-upper" fill="url(#${id}-sand)"/><path class="hourglass-surface" fill="none" stroke="#fff0b5" stroke-width="2"/></g>
      <g clip-path="url(#${id}-bottom)"><path class="hourglass-lower" fill="url(#${id}-sand)"/><path class="hourglass-pile-shade" fill="#ad9363" opacity=".55"/></g>
      <g class="hourglass-stream" fill="#f6df9b"><path class="hourglass-thread" fill="none" stroke="#efd391" stroke-width="1"/>${Array.from({length:8},(_,i)=>`<circle class="hourglass-grain" r="${i%3===0?0.9:0.55}"/>`).join("")}</g>
      </g>
      <path d="M18 31 Q22 48 33 60 M37 65 L44 72 M85 42 Q80 59 68 70 M25 129 L21 144 M32 114 L28 121 M87 130 L91 146" fill="none" stroke="#f6efc3" stroke-width="2.5" stroke-linecap="round"/>
      <path d="M12 26 Q20 67 50 86 M62 95 Q86 119 100 153" fill="none" stroke="#f8e7ae" stroke-width="1.5"/>
      <ellipse cx="56.5" cy="18" rx="49" ry="13" fill="#d5cc92" stroke="#f5e7ad" stroke-width="3"/>
      <ellipse cx="56.5" cy="17" rx="39" ry="8" fill="#244c5a" stroke="#90aaa0" stroke-width="2"/>
      <path d="M24 18 Q55 9 90 17 M33 21 Q58 17 81 20" fill="none" stroke="#f3ebbb" stroke-width="2" stroke-linecap="round"/>
      <path d="M8 153 Q56 174 105 153 L104 163 Q57 184 9 163Z" fill="#c8bf89" stroke="#f0e2a5" stroke-width="3"/>
      <path d="M15 158 Q56 173 99 159" fill="none" stroke="#568d8a" stroke-width="3"/>
    </g>`;
  item.image.insertAdjacentElement("afterend", svg);
  const body = svg.querySelector(".hourglass-body");
  const sand = svg.querySelector(".hourglass-sand");
  const upper = svg.querySelector(".hourglass-upper");
  const surface = svg.querySelector(".hourglass-surface");
  const lower = svg.querySelector(".hourglass-lower");
  const shade = svg.querySelector(".hourglass-pile-shade");
  const stream = svg.querySelector(".hourglass-stream");
  const thread = svg.querySelector(".hourglass-thread");
  const grains = [...svg.querySelectorAll(".hourglass-grain")];
  const smooth = x => x*x*(3-2*x);
  return {
    render(time, enabled) {
      svg.style.display = enabled ? "" : "none";
      item.image.classList.toggle("hero-replaced", enabled);
      if (!enabled) return;
      // Slow the entire choreography, including falling grains and the turn.
      time *= 14 / HOURGLASS_CYCLE_SECONDS;
      const phase = time % 14;
      const turns = Math.floor(time / 14);
      const progress = Math.min(phase / 11, 1);
      const flip = smooth(Math.min(1, Math.max(0, (phase-11.6)/1.6)));
      // Keep turning in the same direction; the frame never snaps back at a loop boundary.
      body.setAttribute("transform", `rotate(${((turns+flip)*180).toFixed(2)} 56.5 89)`);
      sand.setAttribute("transform", `rotate(${turns*180} 56.5 89)`);
      const level = 38 + 47*(1-Math.pow(1-progress, 0.45));
      const notch = (1-progress)*5;
      upper.setAttribute("d", `M8 ${level} Q39 ${level-1} 56.5 ${level+notch} Q75 ${level-1} 105 ${level} V89 H8Z`);
      upper.setAttribute("opacity", progress>0.995?"0":"1");
      surface.setAttribute("d", `M17 ${level} Q38 ${level-1} 56.5 ${level+notch} Q78 ${level-1} 97 ${level}`);
      surface.setAttribute("opacity", progress>0.995?"0":".8");
      const pile = Math.sqrt(progress);
      // Sand settles toward the neck after inversion, before the next pour begins.
      const settle = smooth(Math.max(0, Math.min(1, (phase-13.2)/0.8)));
      const peak = 156-pile*43-settle*24;
      const base = 160-settle*20;
      const radius = pile*45+settle*5;
      lower.setAttribute("d", `M${56.5-radius} ${base} Q40 ${peak+14} 56.5 ${peak} Q70 ${peak+14} ${56.5+radius} ${base} Q75 ${base+settle} 56.5 ${base-settle*5} Q39 ${base+settle} ${56.5-radius} ${base}Z`);
      shade.setAttribute("d", `M56.5 ${peak} Q70 ${peak+14} ${56.5+radius} ${base} H68Z`);
      stream.setAttribute("opacity", phase<10.95?".9":"0");
      thread.setAttribute("d", `M56.5 84 Q${56.5+Math.sin(time*8)*0.5} 101 56.5 ${peak}`);
      grains.forEach((grain,i)=>{
        const travel=(time*1.5+i/8)%1;
        grain.setAttribute("cx", (56.5+Math.sin(i*2.4+time*5)*0.75).toFixed(2));
        grain.setAttribute("cy", (86+travel*(peak-86)).toFixed(2));
      });
    },
    dispose() { svg.remove(); item.image.classList.remove("hero-replaced"); },
  };
}
