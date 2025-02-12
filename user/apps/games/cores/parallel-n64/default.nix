{
  lib,
  stdenv,
  fetchFromGitLab,
  libGL,
  libGLU,
  libpng,
  vulkan-headers,
  vulkan-volk,
  mkLibretroCore,
}:
mkLibretroCore {
  core = "parallel-n64";
  version = "2.22.0";

  src = fetchFromGitLab {
    owner = "parallel-launcher";
    repo = "parallel-n64";
    rev = "a55ddadc51a5d52d411e87e4e1f4461fdba2806b";
    hash = "sha256-YGGPdy+57rc3CklceEjIMFDoyXHwxWVKT86iIieMhUI=";
  };

  extraBuildInputs = [
    libGLU
    libGL
    libpng
    vulkan-headers
    vulkan-volk
  ];
  makefile = "Makefile";
  makeFlags = [
    "HAVE_PARALLEL=1"
    "HAVE_PARALLEL_RSP=1"
    "WITH_DYNAREC=x86_64"
    "HAVE_THR_AL=1"
    "ARCH=${stdenv.hostPlatform.parsed.cpu.name}"
  ];
  patches = [
    ./unistd.patch
  ];
  postPatch = lib.optionalString stdenv.hostPlatform.isAarch64 ''
    sed -i -e '1 i\CPUFLAGS += -DARM_FIX -DNO_ASM -DARM_ASM -DDONT_WANT_ARM_OPTIMIZATIONS -DARM64' Makefile \
    && sed -i -e 's,CPUFLAGS  :=,,g' Makefile
  '';

  meta = {
    description = "Parallel Mupen64plus rewrite for libretro";
    homepage = "https://github.com/libretro/parallel-n64";
    license = lib.licenses.gpl3Only;
  };
}
