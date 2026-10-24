struct Params { count: f32 }

/// Vertical bands of the frame turn over one by one from the left, each
/// band taking the same share of the cut as the one before.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let n = max(params.count, 4.0);
    let s = uv.x * n;
    let i = floor(s);
    let span = 0.45;
    let start = (i / max(n - 1.0, 1.0)) * (1.0 - span);
    let m = smoothstep(start, start + span, progress);
    return mix(from_at(uv), to_at(uv), m);
}
