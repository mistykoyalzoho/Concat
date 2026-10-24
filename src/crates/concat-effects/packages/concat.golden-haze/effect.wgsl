// Held-back contrast lifting the frame into late sun: every channel pulled
// a little towards the middle, then a warm tone added - a different one in
// the shadows than in the light.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let y = clamp(luma(c.rgb), 0.0, 1.0);
    let lo = vec3<f32>(0.06, 0.04, 0.01);
    let hi = vec3<f32>(0.10, 0.06, -0.04);
    return vec4<f32>(c.rgb * 0.94 + mix(lo, hi, y), c.a);
}
