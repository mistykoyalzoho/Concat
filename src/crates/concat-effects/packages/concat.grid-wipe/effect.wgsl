struct Params { tiles: f32 }

fn hash32(x: u32, y: u32) -> f32 {
    var h: u32 = x * 1664525u + y * 1013904223u;
    h = h ^ (h >> 16u);
    h = h * 2246822519u;
    h = h ^ (h >> 13u);
    return f32(h) / 4294967295.0;
}

/// The incoming shot appears in tiles of its own, each tile ahead of or
/// behind its neighbours by its own hash, so the pattern is never drawn
/// twice the same way and never quite fills the frame last.
fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let n = max(params.tiles, 2.0);
    let cell = vec2<u32>(uv * vec2<f32>(n, n));
    let h = hash32(cell.x + cell.y * u32(n), 19u);
    let m = smoothstep(h - 0.05, h + 0.05, progress);
    return mix(from_at(uv), to_at(uv), m);
}
