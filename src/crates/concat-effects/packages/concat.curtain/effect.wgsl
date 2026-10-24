struct Params { softness: f32 }

fn eased(x: f32) -> f32 {
    let t = clamp(x, 0.0, 1.0);
    return t * t * (3.0 - 2.0 * t);
}

/// Two panels of the outgoing shot part from the middle the way a theatre
/// curtain does, the incoming shot behind them the whole time.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let p = eased(progress);
    let soft = max(params.softness * 0.003, 0.001);
    let half_span = abs(uv.x - 0.5) / 0.5;
    let m = smoothstep(1.0 - p - soft, 1.0 - p + soft, half_span);
    return mix(to_at(uv), from_at(uv), m);
}
