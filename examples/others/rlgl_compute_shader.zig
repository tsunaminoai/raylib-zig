// A raylib port of https://github.com/raysan5/raylib/blob/master/examples/others/rlgl_compute_shader.c

const rl = @import("raylib");
const rlgl = @import("rlgl");
const std = @import("std");

const GOL_WIDTH = 768;
const MAX_BUFFERED_TRANSFERTS = 48;

const GolUpdateCmd = struct {
    x: u32,
    y: u32,
    w: u32,
    enabled: u32,
};

const GolUpdateSSBO = struct {
    count: u32,
    commands: [MAX_BUFFERED_TRANSFERTS]GolUpdateCmd,
};

pub fn main() anyerror!void {
    rl.initWindow(GOL_WIDTH, GOL_WIDTH, "raylib [rlgl] example - compute shader - game of life");
    const resolution = rl.Vector2.init(GOL_WIDTH, GOL_WIDTH);
    _ = resolution;
    const brushSize: u32 = 8;
    _ = brushSize;

    var golLogicCode = @embedFile("./resources/glsl430/gol.glsl");
    var golLogicShader = rlgl.compileShader(golLogicCode, rlgl.ShaderType.RL_COMPUTE_SHADER);

    _ = golLogicShader;
}
