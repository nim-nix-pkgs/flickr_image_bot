{
  description = ''Twitter bot for fetching flickr images with tags'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-flickr_image_bot-master.flake = false;
  inputs.src-flickr_image_bot-master.ref   = "refs/heads/master";
  inputs.src-flickr_image_bot-master.owner = "snus-kin";
  inputs.src-flickr_image_bot-master.repo  = "flickr-image-bot";
  inputs.src-flickr_image_bot-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-flickr_image_bot-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-flickr_image_bot-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}