import * as THREE from "./vendor/three/three.module.min.js";

// Object-space pigments rotate with the sphere. View-space light stays fixed.
const vertexShader = `
  varying vec3 vObject;
  varying vec3 vNormal;
  void main() {
    vObject = position;
    vNormal = normalize(normalMatrix * normal);
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  }
`;
const noiseShader = `
  float hash(vec3 p) {
    p = fract(p * 0.3183099 + vec3(0.13, 0.71, 0.37));
    p *= 17.0;
    return fract(p.x * p.y * p.z * (p.x + p.y + p.z));
  }
  float noise(vec3 p) {
    vec3 i = floor(p), f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(mix(hash(i), hash(i+vec3(1,0,0)), f.x),
                   mix(hash(i+vec3(0,1,0)), hash(i+vec3(1,1,0)), f.x), f.y),
               mix(mix(hash(i+vec3(0,0,1)), hash(i+vec3(1,0,1)), f.x),
                   mix(hash(i+vec3(0,1,1)), hash(i+vec3(1,1,1)), f.x), f.y), f.z);
  }
  float paint(vec3 p) {
    return noise(p)*0.62 + noise(p*2.07+3.7)*0.26 + noise(p*4.03)*0.12;
  }
`;
const fragmentShader = `
  varying vec3 vObject;
  varying vec3 vNormal;
  uniform vec3 pigments[5];
  uniform float banded;
  uniform float emphasis;
  ${noiseShader}
  void main() {
    vec3 p = normalize(vObject);
    float warp = paint(p * vec3(3.1, 2.2, 3.1));
    float stripe = p.y * 1.65 + warp * 0.55;
    float pigmentField = 0.5 + 0.25*sin(p.y*5.0 + paint(p*1.7)*4.0) + (paint(p*2.0)-0.5)*0.15;
    float field = mix(pigmentField, (sin(stripe * 3.14159) * 0.5 + 0.5), banded);
    vec3 ink = pigments[0];
    ink = mix(ink, pigments[1], smoothstep(0.28, 0.30, field));
    ink = mix(ink, pigments[2], smoothstep(0.43, 0.45, field));
    ink = mix(ink, pigments[3], smoothstep(0.58, 0.60, field));
    ink = mix(ink, pigments[4], smoothstep(0.74, 0.76, field));
    // Sparse, broken brush lines rather than photographic noise or gloss.
    float brush = smoothstep(0.91, 0.97, sin(stripe * 38.0 + paint(p*7.0)*1.0));
    brush *= smoothstep(0.50, 0.72, paint(p * vec3(7.0, 1.5, 7.0)));
    ink = mix(ink, pigments[4], brush * 0.16);
    vec3 n = normalize(vNormal);
    float light = dot(n, normalize(vec3(-0.6, 0.8, 1.2)));
    float shade = 0.46 + 0.22*smoothstep(-0.12, -0.04, light)
                       + 0.20*smoothstep(0.33, 0.42, light)
                       + 0.12*smoothstep(0.75, 0.85, light);
    vec3 shadow = vec3(0.11, 0.085, 0.18);
    ink = mix(ink * shade, shadow, (1.0-shade)*0.25);
    float rim = (1.0-smoothstep(0.015, 0.11, n.z));
    ink = mix(ink, pigments[3], rim * 0.45);
    ink *= 1.0 + emphasis * 0.09;
    gl_FragColor = vec4(ink, 1.0);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
  }
`;
const ringFragment = `
  varying vec3 vObject;
  varying vec3 vNormal;
  void main() {
    float r = length(vObject.xy);
    if ((r>1.58 && r<1.64) || (r>1.83 && r<1.85)) discard;
    float bands = sin(r*48.0)*0.5+0.5;
    vec3 color = mix(vec3(0.58,0.43,0.26), vec3(0.95,0.82,0.49), bands);
    color = mix(color, vec3(1.0,0.93,0.67), smoothstep(0.72,0.96,sin(r*33.0)*0.5+0.5)*0.6);
    float shadow = smoothstep(-0.95, -0.7, vObject.x) * (1.0-smoothstep(-0.05, 0.45, vObject.y));
    color *= 0.82 + shadow*0.18;
    gl_FragColor = vec4(color, 1.0);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
  }
`;

export function createPlanets(map, items, onRestore) {
  const definitions = [
    { file: "chapter_searching.png", ring: false, period: 58, tilt: -0.24,
      colors: ["#4b526d", "#a7788a", "#63a5a0", "#a6b28c", "#eddb9e"] },
    { file: "chapter_array_and_linkedlist.png", ring: true, period: 76, tilt: 0.55,
      colors: ["#5f546c", "#a8798b", "#d9a36f", "#e8c27f", "#fff0ba"] },
  ];
  const targets = definitions.map(def => ({ ...def,
    item: items.find(item => item.image.getAttribute("src").endsWith("/" + def.file)),
  })).filter(def => def.item);
  if (!targets.length) return null;

  const renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true, powerPreference: "low-power" });
  renderer.setClearColor(0x000000, 0);
  renderer.domElement.className = "hero-objects-canvas";
  renderer.domElement.setAttribute("aria-hidden", "true");
  renderer.debug.onShaderError = (gl, program, vertex, fragment) => {
    throw new Error(`Homepage planet shader: ${gl.getShaderInfoLog(vertex)} ${gl.getShaderInfoLog(fragment)}`);
  };
  const scene = new THREE.Scene();
  const camera = new THREE.OrthographicCamera(-1, 1, 1, -1, 0.1, 4000);
  camera.position.z = 1500;
  const geometry = new THREE.SphereGeometry(1, 64, 48);
  const outlineMaterial = new THREE.MeshBasicMaterial({ color: "#687080", side: THREE.BackSide });
  for (const target of targets) {
    const root = new THREE.Group();
    const spin = new THREE.Group();
    spin.rotation.x = target.ring ? 1.16 - Math.PI / 2 : 0.15;
    const material = new THREE.ShaderMaterial({
      vertexShader, fragmentShader,
      uniforms: {
        pigments: { value: target.colors.map(color => new THREE.Color(color)) },
        banded: { value: target.ring ? 1 : 0 },
        emphasis: { value: 0 },
      },
    });
    const sphere = new THREE.Mesh(geometry, material);
    const outline = new THREE.Mesh(geometry, outlineMaterial);
    outline.scale.setScalar(1.012);
    spin.add(sphere, outline);
    root.add(spin);
    root.rotation.z = target.tilt;
    if (target.ring) {
      const rings = new THREE.Mesh(new THREE.RingGeometry(1.18, 1.96, 160),
        new THREE.ShaderMaterial({ vertexShader, fragmentShader: ringFragment, side: THREE.DoubleSide }));
      rings.rotation.x = 1.16;
      root.add(rings);
    }
    scene.add(root);
    // Projected silhouette, including tilt and rings, determines the fit in the original PNG box.
    root.updateMatrixWorld(true);
    const bounds = new THREE.Box3().setFromObject(root, true);
    target.extent = bounds.getSize(new THREE.Vector3());
    Object.assign(target, { root, spin, material, rect: null });
  }

  // Above ground and network PNGs, below the original anchors and their text.
  map.insertBefore(renderer.domElement, map.querySelector(":scope > a"));
  let width = 0, height = 0, lost = false, disposed = false;
  const showOriginal = show => {
    renderer.domElement.hidden = show;
    targets.forEach(({ item }) => item.image.classList.toggle("hero-replaced", !show));
  };
  function resize() {
    width = map.clientWidth;
    height = map.clientHeight;
    renderer.setPixelRatio(Math.min(devicePixelRatio || 1, matchMedia("(pointer: fine)").matches ? 1.5 : 1));
    renderer.setSize(Math.max(width, 1), Math.max(height, 1), false);
    camera.left = -width / 2; camera.right = width / 2;
    camera.top = height / 2; camera.bottom = -height / 2;
    camera.updateProjectionMatrix();
    targets.forEach(target => {
      const img = target.item.image;
      target.rect = { x: img.offsetLeft, y: img.offsetTop, width: img.offsetWidth, height: img.offsetHeight };
    });
  }
  function render(time, enabled) {
    if (disposed) return;
    if (!enabled || lost || !width || !height) { showOriginal(true); return; }
    for (const target of targets) {
      const { item, rect, root, spin, material, extent } = target;
      const selected = item.anchor.classList.contains("hero-selected");
      const fit = Math.min(rect.width / extent.x, rect.height / extent.y) * 0.98;
      root.scale.setScalar(fit * (selected ? 1.045 : 1));
      root.position.set(rect.x + rect.width/2 + item.x - width/2,
        height/2 - rect.y - rect.height/2 - item.y, 0);
      root.rotation.z = target.tilt - item.angle * Math.PI / 180;
      spin.rotation.y = time * Math.PI * 2 / target.period + 0.4;
      material.uniforms.emphasis.value = selected ? 1 : 0;
    }
    renderer.render(scene, camera);
    showOriginal(false);
  }
  const onLost = event => { event.preventDefault(); lost = true; showOriginal(true); };
  const onRestored = () => { lost = false; resize(); onRestore(); };
  renderer.domElement.addEventListener("webglcontextlost", onLost);
  renderer.domElement.addEventListener("webglcontextrestored", onRestored);
  const onImageLoad = () => { resize(); onRestore(); };
  targets.forEach(({ item }) => item.image.addEventListener("load", onImageLoad));
  showOriginal(true);
  resize();
  return {
    resize, render,
    dispose() {
      disposed = true;
      showOriginal(true);
      targets.forEach(({ item }) => item.image.removeEventListener("load", onImageLoad));
      renderer.domElement.removeEventListener("webglcontextlost", onLost);
      renderer.domElement.removeEventListener("webglcontextrestored", onRestored);
      const geometries = new Set(), materials = new Set();
      scene.traverse(object => {
        if (object.geometry) geometries.add(object.geometry);
        if (object.material) materials.add(object.material);
      });
      geometries.forEach(g => g.dispose());
      materials.forEach(m => m.dispose());
      renderer.dispose();
      renderer.forceContextLoss();
      renderer.domElement.remove();
    },
  };
}
