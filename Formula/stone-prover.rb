class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"
  version "1.0.16"

  depends_on "gmp"
  depends_on "python@3.9"

bottle do
  root_url "https://github.com/MrRoudyk/stone-packaging/releases/download/v1.0.16"
  sha256 cellar: :any_skip_relocation, sonoma: "128af92a7116d44397f1906d08be7938aa72270ccd45eb3792747354fbdf8ff0"
  sha256 cellar: :any_skip_relocation, arm64_sonoma: "6d240df90707734046111bba92b3f0009979102874f191b0c6cb02e362f4997a"
end

  def install
    arch = Hardware::CPU.arch
    bin.install "cpu_air_prover-#{arch}" => "cpu_air_prover"
    bin.install "cpu_air_verifier-#{arch}" => "cpu_air_verifier"
  end

  test do
    %w[cpu_air_prover cpu_air_verifier].each do |binary|
      assert_match version.to_s, shell_output("#{bin}/#{binary} --version")
    end
  end
end
