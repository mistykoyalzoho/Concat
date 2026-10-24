struct Params { amount: f32 }

fn spin(rgb: vec3<f32>, a: f32) -> vec3<f32> {
    let c = cos(a);
    let s = sin(a);
    let y = dot(rgb, vec3<f32>(0.299, 0.587, 0.114));
    let i = dot(rgb, vec3<f32>(0.595716, -0.274453, -0.321263));
    let q = dot(rgb, vec3<f32>(0.211456, -0.522591, 0.311135));
    let ii = i * c - q * s;
    let qq = i * s + q * c;
    return vec3<f32>(y + 0.9563 * ii + 0.6210 * qq,
                     y - 0.2721 * ii - 0.6474 * qq,
                     y - 1.1070 * ii + 1.7046 * qq);
}

/// The colour wheel turned slowly under the picture, so a cutaway takes a new
/// cast every second without a keyframe. Light is kept: only the hue moves.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let turn = fract(frame.time * 0.25) + 0.18;
    let c = sample(uv);
    let tinted = spin(c.rgb, turn * 6.28318530718);
    return vec4<f32>(mix(c.rgb, tinted, params.amount * 0.01), c.a);
}
