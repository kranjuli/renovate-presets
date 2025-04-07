# renovate-presets

List of renovate presets

## Presets

* [updateDebPackageFromArtifactory.json](#updateDebPackageFromArtifactory): renovate preset to scan and update deb package from artifactory source 
* [updateDebPackageInBashScript.json](#updateDebPackageInBashScript): renovate preset to scan and update deb packages in `user-script.sh`
* [switchPipelineResource.json](#switchpipelineresource): renovate config to switch the pipeline jobs and bundles to `canary` channel during an update

===================================

### updateDebPackageFromArtifactory

The preset `updateDebPackageInYaml` automatically updates deb package from artifactory source (in a `.yml` file) 

**Usage**

```js
module.exports = {
    //
    // PRESETS
    //
    extends: [
        // renovate presets
        // base config
        'local>your_renovate_preset_repo/renovate-presets:updateDebPackageInYaml'
    ]
}
```

**Test file**

see [update-deb-package-from-artifactory.yml](examples/update-deb-package-from-artifactory.yml)

==================================

### updateDebPackageInBashScript

The preset `updateDebPackageInBashScript` automatically updates deb package in a `.sh` file 

**Usage**

```js
module.exports = {
    //
    // PRESETS
    //
    extends: [
        // renovate presets
        // base config
        'local>your_renovate_preset_repo/renovate-presets:updateDebPackageInBashScript'
    ]
}
```

**Test file**

see [update-deb-package-in-bash-script.yml](examples/update-deb-package-in-bash-script.sh)

==========================

### switchPipelineResource

The preset `switchPipelineResource` automatically switches the pipeline jobs and bundles 
included in Gitlab CI pipelines from the `release` channel to the `canary` channel during an update.

i.E for the update:

```diff
# bundles/lint_default
- - https://your.url.to.resoure.com:443/artifactory/your-pipeline-generic-release-local/release/bundles/lint_default/6.1.0.0-20250314145426-a25bdc2.yaml
+ - https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/canary/bundles/lint_default/6.1.4.10-20250403191803-2f40fb3.yaml

-  - https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/resolved/release/bundles/lint_default/6.1.4.0-20250328114820-c551dc7.yaml
+  - https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/resolved/canary/bundles/lint_default/6.1.4.10-20250403191803-2f40fb3.yaml

# job build_artifact_ansible
- - https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/release/jobs/build_artifact_ansible/2.3.1.0-20250327142043-b726b96.yaml
+ - https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/canary/jobs/build_artifact_ansible/2.3.1.12-20250403190737-034149a.yaml

- - https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/resolved/release/jobs/build_artifact_ansible/2.3.1.0-20250327142043-b726b96.yaml
+ + https://your.url.to.resoure.com/artifactory/your-pipeline-generic-release-local/resolved/canary/jobs/build_artifact_ansible/2.3.1.12-20250403190737-034149a.yaml
```

**Usage**

```js
module.exports = {
    //
    // PRESETS
    //
    extends: [
        // renovate presets
        // base config
        'local>your_renovate_preset_repo/renovate-presets:switchPipelineResource'
    ]
}
```

**Test file**

see [job-switch_pipline_resource](examples/job-switch_pipline_resource.yaml)