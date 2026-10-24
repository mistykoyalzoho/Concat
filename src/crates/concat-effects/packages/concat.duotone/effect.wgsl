struct Params { amount: f32 }

// Every level of light mapped between two colours, carried by the picture's
// own luma so the shape survives the recolour. Mixed in light, where the
// mix of two colours is the mix of their lights.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let y = clamp(luma(c.rgb), 0.0, 1.0);
    let shadow = vec3<f32>(0.05, 0.02, 0.16);
    let light = vec3<f32>(1.0, 0.72, 0.18);
    let tone = mix(shadow, light, y);
    return vec4<f32>(mix(c.rgb, tone, params.amount * 0.01), c.a);
}
