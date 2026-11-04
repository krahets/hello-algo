/* Isolated figures; prepare a complete slideshow before its first transition. */
(() => {
  'use strict';
  if (customElements.get('ha-svg-figure')) return;
  const {resource, decode, fonts, theme} = FigureWeb;
  const sequences = new WeakMap();
  function sequence(group) {
    if (sequences.has(group)) return sequences.get(group);
    let pending = null, pendingTheme, intent = null;
    const prepare = () => {
      if (pending && pendingTheme === theme()) return pending;
      pendingTheme = theme();
      group.dataset.figureState = 'loading'; group.setAttribute('aria-busy', 'true');
      const work = Promise.all([...group.querySelectorAll('ha-svg-figure')].map(host => host.prepare()))
        .then(results => {
          if (pending !== work) return false;
          pending = null;
          group.dataset.figureState = results.every(Boolean) ? 'ready' : 'error';
          group.removeAttribute('aria-busy');
          const target = intent; intent = null;
          if (group.dataset.figureState === 'ready' && target?.isConnected) target.click();
          return results.every(Boolean);
        });
      pending = work;
      return pending;
    };
    group.addEventListener('click', event => {
      const target = event.target.closest('.animation-controls button, .tabbed-labels label');
      if (!target || target.closest('.tabbed-set') !== group) return;
      if (group.dataset.figureState === 'ready') return;
      event.preventDefault(); event.stopImmediatePropagation();
      intent = target; prepare();
    }, true);
    const observer = new IntersectionObserver(entries => {
      if (entries.some(entry => entry.isIntersecting)) prepare();
    }, {rootMargin:'300px'});
    observer.observe(group);
    sequences.set(group, prepare);
    return prepare;
  }
  // A native SVG owns its font scope. Give its inline Shadow DOM copy the same
  // subset without a network request or a collision with another frame's glyphs.
  const embedded = new Map();
  async function prepareFaces(svg, revision) {
    const aliases = new Map(), loads = [];
    for (const style of svg.querySelectorAll('style')) {
      if (!style.textContent.includes('@font-face')) continue;
      const sheet = new CSSStyleSheet();
      sheet.replaceSync(style.textContent);
      for (const rule of sheet.cssRules) {
        if (rule.type !== CSSRule.FONT_FACE_RULE) continue;
        const family = rule.style.fontFamily.replace(/^["']|["']$/g, '');
        const alias = family + '-' + revision;
        const weight = rule.style.fontWeight || '400';
        const key = alias + ':' + weight;
        aliases.set(family, alias);
        if (!embedded.has(key)) {
          const face = new FontFace(alias, rule.style.getPropertyValue('src'), {weight});
          embedded.set(key, face.load().then(f => document.fonts.add(f))
            .catch(error => {embedded.delete(key); throw error;}));
        }
        loads.push(embedded.get(key));
      }
    }
    for (const node of svg.querySelectorAll('[font-family]')) {
      const alias = aliases.get(node.getAttribute('font-family'));
      if (alias) node.setAttribute('font-family', alias);
    }
    await Promise.all(loads);
  }
  function display(host, svg, model) {
    const style = document.createElement('style');
    style.textContent = ':host{color-scheme:normal}svg{display:block;width:100%;height:auto;background:var(--ha-figure-background,white)}svg:focus-visible{outline:2px solid #6a9d8a;outline-offset:-2px}';
    // Hidden steps have no layout. Prepare in an isolated, non-visible layout
    // surface, then move the finished SVG into its actual shadow tree atomically.
    const stage = document.createElement('div');
    stage.setAttribute('aria-hidden', 'true');
    stage.style.cssText = `position:fixed;left:-100000px;top:0;width:${svg.viewBox.baseVal.width}px;visibility:hidden;pointer-events:none`;
    const staging = stage.attachShadow({mode:'open'});
    staging.append(style, svg); document.body.append(stage);
    try {
      if (model) HelloAlgoReading.mount(svg, model);
      if (svg.reading?.state().issues.length) throw Error(svg.reading.state().issues.join('; '));
      const shadow = host.shadowRoot || host.attachShadow({mode:'open'});
      shadow.replaceChildren(style, svg);
    } catch (error) {
      svg.reading?.destroy(); throw error;
    } finally { stage.remove(); }
  }
  class BookFigure extends HTMLElement {
    connectedCallback() {
      this.loads = new Map();
      this.dataset.state = 'pending';
      const group = this.closest('[data-figure-sequence]');
      this.unsubscribe = FigureWeb.subscribe(() => {
        if (!this.active) return;
        if (group) sequence(group)();
        else this.prepare();
      });
      if (group) {
        group.dataset.figureState = 'pending'; sequence(group);
      } else {
        this.observer = new IntersectionObserver(entries => {
          if (entries.some(entry => entry.isIntersecting)) {
            this.observer.disconnect(); this.prepare();
          }
        }, {rootMargin:'300px'});
        this.observer.observe(this);
      }
    }
    disconnectedCallback() {
      this.active = false; this.loads.clear(); this.current = null;
      this.showStatic();
      this.observer?.disconnect();
      this.unsubscribe?.();
    }
    prepare() {
      this.active = true;
      const url = (theme() && this.dataset.darkSrc) || this.dataset.src;
      if (this.current?.url === url) return this.current.ready;
      const request = {url};
      this.current = request;
      if (!this.loads.has(url)) {
        this.showStatic();
        const loads = this.loads;
        loads.set(url, this.load(url).catch(error => {loads.delete(url); throw error;}));
      }
      request.ready = this.loads.get(url).then(chosen => {
        if (this.current !== request) return false;
        const previous = this.shadowRoot?.querySelector('svg');
        display(this, chosen.svg.cloneNode(true), chosen.reading);
        previous?.reading?.destroy();
        this.dataset.state = 'ready';
        this.dataset.themeState = 'ready';
        return true;
      }).catch(error => {
        if (this.current !== request) return false;
        this.current = null;
        this.showStatic();
        this.dataset.themeState = 'partial';
        console.warn('Could not enhance book figure', url, error);
        return true;  // The selected theme's native figure remains usable.
      }).then(ready => {
        if (ready) this.dispatchEvent(new CustomEvent('figureready', {bubbles:true}));
        return ready;
      });
      return request.ready;
    }
    showStatic() {
      this.shadowRoot?.querySelector('svg')?.reading?.destroy();
      // The native document stays in the light DOM throughout enhancement.
      this.shadowRoot?.replaceChildren(document.createElement('slot'));
      this.dataset.state = 'static';
    }
    async load(value) {
      const url = new URL(value, document.baseURI).href;
      const model = await resource(url, true);
      if (model.version !== 1) throw Error('Unknown figure package');
      const svgURL = new URL(model.svg, url).href;
      // A cached reading model must only enhance its matching SVG revision.
      const integrity = model.svg_sha256 ? 'sha256-' + btoa(String.fromCharCode(
        ...model.svg_sha256.match(/../g).map(pair => parseInt(pair, 16)))) : '';
      const [source] = await Promise.all([
        resource(svgURL, false, integrity),
        fonts(model.fonts),
      ]);
      const parsed = new DOMParser().parseFromString(source, 'image/svg+xml');
      const svg = parsed.documentElement;
      if (svg.localName !== 'svg' || parsed.querySelector('parsererror, script')) throw Error('Invalid figure SVG');
      const images = [];
      for (const node of svg.querySelectorAll('*')) for (const attr of [...node.attributes]) {
        if (attr.localName === 'href' && !attr.value.startsWith('#')) {
          attr.value = new URL(attr.value, svgURL).href;
          if (node.localName === 'image') images.push(decode(attr.value));
        }
      }
      await Promise.all([...images, prepareFaces(svg, model.svg_sha256)]);
      return {svg:document.importNode(svg,true),reading:model.reading};
    }
  }
  customElements.define('ha-svg-figure', BookFigure);
})();
