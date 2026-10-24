fn hash32(x: u32, y: u32) -> f32 {
    var h: u32 = x * 1664525u + y * 1013904223u;
    h = h ^ (h >> 16u);
    h = h * 2246822519u;
    h = h ^ (h >> 13u);
    return f32(h) / 4294967295.0;
}

fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let px = vec2<u32>(uv * frame.size);
    let n = hash32(px.x + px.y * u32(frame.size.x), 7u);
    let m = smoothstep(n, n + 0.1, progress);
    return mix(from_at(uv), to_at(uv), m);
}
