terraform {
  required_providers {
    tmc = {
      source = "vmware/tanzu-mission-control"
    }
  }
}

provider "tmc" {
  endpoint = var.endpoint # optionally use TMC_ENDPOINT env var
  token = var.token       # optionally use TMC_CSP_TOKEN env var

  # if you are using dev or different csp endpoint, change the default value below
  # for production environments the csp_endpoint is console.cloud.vmware.com
  # csp_endpoint = "console.cloud.vmware.com" or optionally use TMC_CSP_ENDPOINT env var
}
