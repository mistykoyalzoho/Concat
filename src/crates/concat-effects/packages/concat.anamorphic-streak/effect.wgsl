struct Params { amount: f32 }

// Highlights past SDR white smear sideways into a cold anamorphic streak:
// the flare a wide, blue-coated lens throws off a specular. `amount` is the
// share of the light past white that comes back as streak, so the picture
// is untouched wherever nothing is over white.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let peak = max(max(c.r, c.g), c.b);
    let over = max(peak - 1.0, 0.0);
    let k = over * params.amount * 0.01;
    return vec4<f32>(c.rgb + vec3<f32>(0.35, 0.6, 1.0) * k, c.a);
}
