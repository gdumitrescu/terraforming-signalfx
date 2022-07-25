module "workshop_dashboards" {
  source      = "./modules/dashboards"
  detector_id_latency = module.workshop_detectors.detector_infra_static_threshold_latency_id
}

module "workshop_detectors" {
  source = "./modules/detectors"
}
