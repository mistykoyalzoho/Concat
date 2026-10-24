struct Params { amount: f32 }

// Cross-processing: film developed in the wrong chemistry, so the shadows
// take the colour the highlights gave up. Each channel is carried from its
// own level between a shadow and a highlight of its own, which is what
// makes the split; the clamp stops a level past white inventing a tone no
// film could have.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let x = clamp(c.rgb, vec3<f32>(0.0), vec3<f32>(1.0));
    let shadow = vec3<f32>(0.02, 0.06, 0.14);
    let high = vec3<f32>(1.0, 0.94, 0.72);
    let tone = shadow + (high - shadow) * x;
    return vec4<f32>(mix(c.rgb, tone, params.amount * 0.01), c.a);
}
