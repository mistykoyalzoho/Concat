struct Params { curve: f32 }

/// A tube's barrel, its dark line on every other row and its dimmer corners.
/// `curve` is how hard the glass bows; at zero the frame is left where it is.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let p = uv * 2.0 - vec2<f32>(1.0);
    let r2 = dot(p, p);
    let bend = 1.0 + params.curve * 0.0004 * r2;
    let q = p * bend;
    let c = sample(clamp(q * 0.5 + vec2<f32>(0.5), vec2<f32>(0.0), vec2<f32>(1.0)));
    let s = 0.5 + 0.5 * cos(uv.y * frame.size.y * 3.14159265 + 0.7);
    let gain = (1.0 + params.curve * 0.15 * r2) * (1.0 - 0.18 * (1.0 - s));
    return vec4<f32>(c.rgb * gain, c.a);
}
