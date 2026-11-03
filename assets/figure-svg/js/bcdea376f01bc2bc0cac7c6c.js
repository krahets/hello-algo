/* Shared book resources and a single theme notification source. */
(() => {
  const requests = new Map(), images = new Map(), listeners = new Set();
  let currentTheme = 0;
  const theme = () => currentTheme;
  function setTheme(value) {
    if (!['light', 'dark'].includes(value)) throw Error('Unknown figure theme');
    const next = value === 'dark' ? 1 : 0;
    if (next === currentTheme) return;
    currentTheme = next;
    for (const listener of listeners) listener(next);
  }
  window.addEventListener('online', () => {for (const listener of listeners) listener(theme());});
  function cached(cache, key, work) {
    if (!cache.has(key)) cache.set(key, work().catch(error => {cache.delete(key); throw error;}));
    return cache.get(key);
  }
  async function response(url, integrity) {
    for (let attempt=0; attempt<2; attempt++) {
      try {
        const result=await fetch(url, {integrity});
        if (result.status >= 500 && attempt === 0) continue;
        if (!result.ok) throw Error(`Figure resource: ${result.status}`);
        return result;
      } catch(error) {
        if (!(error instanceof TypeError) || attempt) throw error;
      }
    }
  }
  function resource(url, json = false, integrity = "") {
    return cached(requests, `${json}:${url}:${integrity}`, async () => {
      const result = await response(url, integrity);
      return json ? result.json() : result.text();
    });
  }
  function decode(url) {
    return cached(images, url, async () => {const image = new Image(); image.src = url; await image.decode();});
  }
  async function fonts(definitions) {
    await Promise.all(definitions.map(async font => {
      const faces = await document.fonts.load(`${font.weight} 16px "${font.family}"`);
      if (!faces.length) throw Error(`Shared font unavailable: ${font.family}`);
    }));
  }
  async function variants(urls, prepare) {
    return Promise.all(urls.map(async url => {
      if (!url) return null;
      try {return await prepare(url);} catch (error) {return {error};}
    }));
  }
  const available = value => value && !value.error;
  function choose(values) {return available(values[theme()]) ? values[theme()] : values.find(available);}
  async function animation(url) {
    const doc = await resource(url, true), media = new Set(), faces = new Map();
    function inspect(value) {
      if (Array.isArray(value)) value.forEach(inspect);
      else if (value && typeof value === 'object') {
        const a = value.attrs;
        if (a?.['font-family']) {
          const font = {family:a['font-family'], weight:Number(a['font-weight'] || 400)};
          faces.set(`${font.family}:${font.weight}`, font);
        }
        if (value.tag === 'image') for (const [key, uri] of Object.entries(a || {})) {
          if (key === 'href' || key.endsWith('}href')) media.add(new URL(uri, new URL(url, document.baseURI)).href);
        }
        Object.values(value).forEach(inspect);
      }
    }
    inspect(doc.assets);
    await Promise.all([fonts([...faces.values()]), ...[...media].map(decode)]);
    return doc;
  }
  window.FigureWeb = {theme, setTheme, resource, decode, fonts, variants, choose, available, animation,
    subscribe(fn) {listeners.add(fn); return () => listeners.delete(fn);}};
})();
