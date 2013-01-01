package {
    import starling.textures.Texture;
    public class Assets {
        [Embed(source = "../assets/star.png")] public static const STAR:Class;
        public static const StarTexture:Texture = Texture.fromBitmap(new STAR());
    }
}