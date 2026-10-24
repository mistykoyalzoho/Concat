struct Params { strength: f32 }

/// Beams fanning up out of a point below the frame, fading with distance:
/// the club's lasers seen from the floor.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let src = vec2<f32>(0.5, -0.1);
    let d = uv - src;
    let ang = atan2(d.x, d.y);
    let r = length(d);
    let beams = pow(abs(sin(ang * 5.0)), 3.0);
    let fall = clamp(1.0 - r * 0.9, 0.0, 1.0);
    let glow = beams * fall * params.strength * 0.01;
    let c = sample(uv);
    return vec4<f32>(c.rgb + vec3<f32>(1.0, 0.35, 0.8) * glow, c.a);
}
