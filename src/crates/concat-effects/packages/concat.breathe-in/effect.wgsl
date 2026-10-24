struct Params { strength: f32 }

fn eased(x: f32) -> f32 {
    let t = clamp(x, 0.0, 1.0);
    return t * t * (3.0 - 2.0 * t);
}

/// The outgoing shot zooms into its own middle while the incoming shot pushes
/// out past it from the centre; `strength` is how deep the zoom goes.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let p = eased(progress);
    let strength = params.strength * 0.01;
    let front = 1.0 - p * (0.4 + strength);
    let r = length(uv - vec2<f32>(0.5)) * 2.0;
    let m = smoothstep(front, front + 0.35, r);
    let dim = 1.0 - (1.0 - m) * p * strength * 0.5;
    let zoomed = from_at(uv / (1.0 + p * strength) * (0.5) + vec2<f32>(0.5 - 0.5 / (1.0 + p * strength)));
    let c = mix(zoomed, to_at(uv), m) * vec4<f32>(dim, dim, dim, 1.0);
    return vec4<f32>(c.rgb, c.a);
}
