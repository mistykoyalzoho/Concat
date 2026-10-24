struct Params { amount: f32 }

/// A soft diagonal reflection laid over the picture, as a filter stack in
/// front of a lens catches the room. Sits on the glass, not on the light,
/// so it does not care how bright the frame is.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let s = uv.x * 0.7 + uv.y * 0.3;
    let d = abs(s - 0.55);
    let g = max(1.0 - d / 0.22, 0.0);
    let k = g * g * params.amount * 0.0025;
    let c = sample(uv);
    return vec4<f32>(c.rgb + vec3<f32>(0.9, 0.95, 1.0) * k, c.a);
}
