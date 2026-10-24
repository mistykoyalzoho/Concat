struct Params { size: f32 }

/// One lamp sweeping the frame, everything outside its pool held down to a
/// quarter. `size` is the pool's radius as a share of the frame.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let centre = vec2<f32>(0.5) + vec2<f32>(0.3 * cos(frame.time * 0.7), 0.3 * sin(frame.time * 0.7));
    let radius = max(params.size, 1.0) * 0.01;
    let r = length(uv - centre) / radius;
    let mask = smoothstep(1.0, 0.35, r);
    let c = sample(uv);
    return vec4<f32>(c.rgb * (0.25 + 0.75 * mask), c.a);
}
