Shader "Custom/checkeredShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _WhiteColor ("White Color", Color) = (1, 1, 1, 1)
        _BlackColor ("Black Color", Color) = (0, 0, 0, 1)
        _TileSize ("Tile Size", Vector) = (2, 2, 0, 0) // Decreased tile size for smaller squares
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _WhiteColor;
            float4 _BlackColor;
            float2 _TileSize;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv * _TileSize; // Scale UV coordinates based on tile size
                uv = floor(uv); // Round down to integers
                float2 grid = fmod(uv, 2.0); // Modulo 2 to get checker pattern
                fixed4 color = (grid.x + grid.y == 1.0) ? _WhiteColor : _BlackColor; // Alternating black and white squares
                return color;
            }
            ENDCG
        }
    }
}
