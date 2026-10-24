// A cool push through the toe under a slightly warmed highlight: one colour
// added in the shadows, another in the light, blended by the picture's own
// luma. Nothing is clamped, so a highlight past white keeps climbing.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let y = clamp(luma(c.rgb), 0.0, 1.0);
    let shadow = vec3<f32>(0.0, 0.05, 0.07);
    let high = vec3<f32>(0.05, 0.02, -0.02);
    return vec4<f32>(c.rgb + mix(shadow, high, y), c.a);
}
