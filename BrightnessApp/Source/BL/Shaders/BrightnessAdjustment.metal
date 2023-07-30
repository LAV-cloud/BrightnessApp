//
//  BrightnessAdjustment.metal
//  BrightnessApp
//
//  Created by Ромка Бережной on 30.07.2023.
//

#include <metal_stdlib>
using namespace metal;


constexpr sampler bilinear_sampler(mag_filter::linear, min_filter::linear);


fragment half4 brightnessAdjustment(
    texture2d<half, access::sample> input [[texture(0)]],
    constant half &brightness [[buffer(0)]],
    float2 textureCoordinate [[stage_in]]
) {
    half4 color = input.sample(bilinear_sampler, textureCoordinate);
    color.rgb += brightness;
    return color;
}
