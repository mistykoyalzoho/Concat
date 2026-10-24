struct Params { softness: f32 }

// A diagonal edge travelling the frame from the top-left corner: distance
// along the diagonal is `(x + y) / 2`, the edge sits at `progress` along it,
// and `softness` is how far either side the change is faded.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let s = max(params.softness * 0.01, 0.0001);
    let d = (uv.x + uv.y) * 0.5;
    let e = smoothstep(progress - s, progress + s, d);
    return mix(to_at(uv), from_at(uv), e);
}
