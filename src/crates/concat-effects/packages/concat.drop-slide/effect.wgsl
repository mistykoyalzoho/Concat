struct Params { lift: f32 }

/// The incoming shot drops in from the right of the frame, a little darker
/// than it will be by the time it settles. `lift` is how much of that
/// darkness it sheds on the way in; at zero the shot is a plain slide.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let q = progress * progress;
    let edge = 1.0 - q;
    let soft = 0.03;
    let m = smoothstep(edge - soft, edge + soft, uv.x);
    let t = to_at(uv);
    let lit = vec4<f32>(t.rgb * (1.0 - params.lift * 0.01 * (1.0 - q)), t.a);
    let c = mix(from_at(uv), lit, m);
    return vec4<f32>(c.rgb, c.a);
}
