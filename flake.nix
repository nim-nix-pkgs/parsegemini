{
  description = ''Library for parsing text/gemini'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."parsegemini-master".dir   = "master";
  inputs."parsegemini-master".owner = "nim-nix-pkgs";
  inputs."parsegemini-master".ref   = "master";
  inputs."parsegemini-master".repo  = "parsegemini";
  inputs."parsegemini-master".type  = "github";
  inputs."parsegemini-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."parsegemini-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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