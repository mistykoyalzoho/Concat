struct Params { rate: f32 }

/// Light bursts from the middle of the cut and runs out to the corners,
/// carrying the incoming shot behind its front and leaving a hot rim on
/// the line where it meets the outgoing one.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let front = progress * 3.2;
    let r = length(uv - vec2<f32>(0.5)) * 2.0;
    let m = smoothstep(front - 0.08, front + 0.08, r);
    let rim = (1.0 - m) * m * 4.0 * params.rate * 0.01 * 0.45;
    let lit = mix(to_at(uv), from_at(uv), m);
    return vec4<f32>(lit.rgb + vec3<f32>(1.0, 0.75, 0.35) * rim, lit.a);
}
