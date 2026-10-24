struct Params { warmth: f32 }

/// The incoming shot comes up from the bottom of the frame as a horizon,
/// with a warm lip of light right on the line where it crosses the
/// outgoing one.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let soft = 0.02;
    let edge = smoothstep(progress - soft, progress + soft, uv.y);
    let lit = mix(to_at(uv), from_at(uv), edge);
    let lip = (1.0 - edge) * edge * 4.0 * params.warmth * 0.01;
    return vec4<f32>(lit.rgb + vec3<f32>(1.0, 0.55, 0.15) * lip, lit.a);
}
