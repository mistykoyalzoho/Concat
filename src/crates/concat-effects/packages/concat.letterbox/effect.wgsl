struct Params { softness: f32 }

/// Black bars slide in from the top and bottom until they meet, the shot
/// they cross there, and they slide off revealing the one that arrived.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let soft = max(params.softness * 0.003, 0.001);
    let cover = 1.0 - abs(2.0 * progress - 1.0);
    let d = abs(uv.y - 0.5) * 2.0;
    let m = smoothstep(1.0 - cover - soft, 1.0 - cover + soft, d);
    let under = mix(from_at(uv), to_at(uv), smoothstep(0.45, 0.55, progress));
    let black = vec4<f32>(0.0, 0.0, 0.0, from_at(uv).a);
    return mix(under, black, m);
}
