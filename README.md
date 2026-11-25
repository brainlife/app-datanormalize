<h1 align="center">Round b-values / Flip b-vecs for dtiInit</h1>

<p align="center">
  (soon to be deprecated) This service round the b-values to the nearest 100. It will also flip the b-vecs around one or more chosen axes (please use Test Gradient Flip app to find out which one needs to be flipped). Some apps requires b-values to be round for their algorithms to work properly.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/bl.app.4"><img src="https://img.shields.io/badge/Brainlife-bl.app.4-blue.svg" alt="Run on brainlife.io"></a>
  <a href="https://github.com/brainlife/app-datanormalize/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> **This branch, `1.1`, is the deprecated brainlife.io App Round b-values / Flip b-vecs for dtiInit** ([doi:10.25663/bl.app.4](https://doi.org/10.25663/bl.app.4)). It is kept so earlier results stay reproducible. Use **Split Shells** ([doi:10.25663/bl.app.17](https://doi.org/10.25663/bl.app.17)) instead.

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **(soon to be deprecated) This service round the b-values to the nearest 100. It will also flip the b-vecs around one or more chosen axes (please use Test Gradient Flip app to find out which one needs to be flipped). Some apps requires b-values to be round for their algorithms to work properly.**

| | |
|---|---|
| **Inputs** | `neuro/dwi` |
| **Outputs** | `neuro/dwi` |
| **Container** | `brainlife/mcr:neurodebian1604-r2017a` |
| **Run it** | [doi.org/10.25663/bl.app.4](https://doi.org/10.25663/bl.app.4) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` | yes |  |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/dwi` |  |

<details>
<summary><b>Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `xflip` | boolean | `false` | X-Flip (often required by Siemens/GE) |
| `yflip` | boolean | `false` | Y-Flip |
| `zflip` | boolean | `false` | Z-Flip (often required by Philips) |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/bl.app.4](https://doi.org/10.25663/bl.app.4), choose `neuro/dwi` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/dwi`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mcr:neurodebian1604-r2017a`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "dwi": "/path/to/dwi/dwi",
       "bvecs": "/path/to/dwi/bvecs",
       "bvals": "/path/to/dwi/bvals",
       "xflip": false,
       "yflip": false,
       "zflip": false
   }
   ```

3. Run `./main`.

## Build docker container

If you are not going to use the one that we've published on docker hub, you can build the container locally by git cloning this repo, and then run following command

`docker build -t app-datanormalize .`

## Create config.json

This container receives input parameter via config.json. Create something like following in your current working directory.

```
{
        "bvals": "/input/dwi.bvals",
        "bvecs": "/input/dwi.bvecs",
        "dwi": "/input/dwi.nii.gz",
        "xflip": true,
        "yflip": false,
        "zflip": false
}
```

/input is a path inside the container which we will map from our host directory. In this example, I will create a directory called testdata in my working directory.

```
mkdir testdata
# copy your dwi.bvals, dwi.bvecs, and dwi.nii.gz in to testdata
```

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Round b-values / Flip b-vecs for dtiInit. brainlife.io App. [doi:10.25663/bl.app.4](https://doi.org/10.25663/bl.app.4)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

brainlife.io team

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

See [LICENSE](https://github.com/brainlife/app-datanormalize/blob/master/LICENSE).
