{
  description = ''Twitter bot for fetching flickr images with tags'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."flickr_image_bot-master".dir   = "master";
  inputs."flickr_image_bot-master".owner = "nim-nix-pkgs";
  inputs."flickr_image_bot-master".ref   = "master";
  inputs."flickr_image_bot-master".repo  = "flickr_image_bot";
  inputs."flickr_image_bot-master".type  = "github";
  inputs."flickr_image_bot-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."flickr_image_bot-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}