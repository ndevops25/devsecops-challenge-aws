# devsecops-challenge-oci
Challenge Infraestructure develop with Terraform, provided in OCI cloud

🏭 Estrutura Otimizada - Sistema de Manutenção Preditiva Industrial
===================================================================

📁 Estrutura Principal Otimizada
--------------------------------

```
predictive-maintenance-oci/
├── 📄 README.md
├── 📄 .gitignore
├── 📄 docker-compose.yml
├── 📄 Makefile
├── 📄 LICENSE
├── 📄 .env.example
├── 📄 .github/
│   └── workflows/
│       ├── ci-cd.yml
│       ├── security-scan.yml
│       └── terraform-validate.yml
│
├── 🗂️ infrastructure/
│   ├── 📄 main.tf
│   ├── 📄 variables.tf
│   ├── 📄 outputs.tf
│   ├── 📄 terraform.tfvars.example
│   ├── 📄 provider.tf
│   ├── 📄 versions.tf
│   └── 🗂️ modules/
│       ├── 🗂️ core-infrastructure/
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 vcn.tf
│       │   ├── 📄 subnets.tf
│       │   ├── 📄 security_groups.tf
│       │   ├── 📄 route_tables.tf
│       │   └── 📄 internet_gateway.tf
│       ├── 🗂️ security/
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 iam.tf
│       │   ├── 📄 vault.tf
│       │   ├── 📄 waf.tf
│       │   ├── 📄 certificates.tf
│       │   └── 📄 bastion.tf
│       ├── 🗂️ kubernetes/
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 oke_cluster.tf
│       │   ├── 📄 node_pools.tf
│       │   ├── 📄 addons.tf
│       │   └── 📄 rbac.tf
│       ├── 🗂️ storage/
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 object_storage.tf
│       │   ├── 📄 autonomous_database.tf
│       │   ├── 📄 redis_cache.tf
│       │   └── 📄 backup_policies.tf
│       ├── 🗂️ monitoring/
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 prometheus.tf
│       │   ├── 📄 grafana.tf
│       │   ├── 📄 alertmanager.tf
│       │   ├── 📄 logging.tf
│       │   └── 📄 dashboards.tf
│       └── 🗂️ devsecops/
│           ├── 📄 main.tf
│           ├── 📄 variables.tf
│           ├── 📄 outputs.tf
│           ├── 📄 jenkins.tf
│           ├── 📄 sonarqube.tf
│           ├── 📄 container_registry.tf
│           ├── 📄 trivy.tf
│           ├── 📄 owasp_zap.tf
│           └── 📄 ci_cd_pipeline.tf
│
├── 🗂️ microservices/
│   ├── 🗂️ iot-data-ingestion/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 requirements.txt
│   │   ├── 📄 main.py
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 sensor_data.py
│   │   │   │   │   ├── 📄 equipment.py
│   │   │   │   │   └── 📄 telemetry.py
│   │   │   │   ├── 🗂️ repositories/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 sensor_repository.py
│   │   │   │   │   └── 📄 telemetry_repository.py
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 data_validation_service.py
│   │   │   │       └── 📄 mqtt_service.py
│   │   │   ├── 🗂️ application/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ use_cases/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 ingest_sensor_data.py
│   │   │   │   │   └── 📄 validate_telemetry.py
│   │   │   │   └── 🗂️ interfaces/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 data_ingestion_interface.py
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ messaging/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 kafka_producer.py
│   │   │   │   │   └── 📄 mqtt_client.py
│   │   │   │   └── 🗂️ repositories/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 oracle_sensor_repository.py
│   │   │   └── 🗂️ presentation/
│   │   │       ├── 📄 __init__.py
│   │   │       └── 🗂️ api/
│   │   │           ├── 📄 __init__.py
│   │   │           ├── 📄 routes.py
│   │   │           └── 📄 controllers/
│   │   │               └── 📄 ingestion_controller.py
│   │   ├── 🗂️ tests/
│   │   └── 🗂️ config/
│   │
│   ├── 🗂️ ml-prediction-engine/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 requirements.txt
│   │   ├── 📄 main.py
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 prediction.py
│   │   │   │   │   ├── 📄 ml_model.py
│   │   │   │   │   └── 📄 anomaly.py
│   │   │   │   ├── 🗂️ repositories/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 model_repository.py
│   │   │   │   │   └── 📄 prediction_repository.py
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 prediction_service.py
│   │   │   │       ├── 📄 anomaly_detection_service.py
│   │   │   │       └── 📄 model_training_service.py
│   │   │   ├── 🗂️ application/
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ ml/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 tensorflow_model.py
│   │   │   │   │   ├── 📄 sklearn_model.py
│   │   │   │   │   └── 📄 model_loader.py
│   │   │   │   └── 🗂️ storage/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 oci_model_storage.py
│   │   │   └── 🗂️ presentation/
│   │   ├── 🗂️ models/
│   │   │   ├── 🗂️ trained/
│   │   │   └── 🗂️ experiments/
│   │   ├── 🗂️ tests/
│   │   └── 🗂️ config/
│   │
│   ├── 🗂️ analytics-dashboard/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 package.json
│   │   ├── 📄 server.js
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 index.js
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 dashboard.js
│   │   │   │   │   ├── 📄 metrics.js
│   │   │   │   │   └── 📄 kpi.js
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 analytics-service.js
│   │   │   │       └── 📄 dashboard-service.js
│   │   │   ├── 🗂️ application/
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 🗂️ database/
│   │   │   │   ├── 🗂️ cache/
│   │   │   │   └── 🗂️ repositories/
│   │   │   └── 🗂️ presentation/
│   │   │       ├── 🗂️ api/
│   │   │       └── 🗂️ web/
│   │   │           ├── 📄 dashboard.html
│   │   │           ├── 📄 real-time.html
│   │   │           └── 🗂️ assets/
│   │   ├── 🗂️ tests/
│   │   └── 🗂️ config/
│   │
│   ├── 🗂️ alert-notification/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 requirements.txt
│   │   ├── 📄 main.py
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 alert.py
│   │   │   │   │   ├── 📄 notification.py
│   │   │   │   │   └── 📄 escalation.py
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 email_service.py
│   │   │   │       ├── 📄 slack_service.py
│   │   │   │       └── 📄 alert_service.py
│   │   │   ├── 🗂️ application/
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 🗂️ messaging/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 kafka_consumer.py
│   │   │   │   │   └── 📄 webhook_client.py
│   │   │   │   └── 🗂️ providers/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 email_provider.py
│   │   │   │       └── 📄 slack_provider.py
│   │   │   └── 🗂️ presentation/
│   │   ├── 🗂️ tests/
│   │   └── 🗂️ config/
│   │
│   └── 🗂️ equipment-management/
│       ├── 📄 Dockerfile
│       ├── 📄 requirements.txt
│       ├── 📄 main.py
│       ├── 🗂️ src/
│       │   ├── 🗂️ domain/
│       │   │   ├── 📄 __init__.py
│       │   │   ├── 🗂️ entities/
│       │   │   │   ├── 📄 __init__.py
│       │   │   │   ├── 📄 equipment.py
│       │   │   │   ├── 📄 maintenance_schedule.py
│       │   │   │   └── 📄 work_order.py
│       │   │   └── 🗂️ services/
│       │   │       ├── 📄 __init__.py
│       │   │       ├── 📄 equipment_service.py
│       │   │       └── 📄 maintenance_service.py
│       │   ├── 🗂️ application/
│       │   ├── 🗂️ infrastructure/
│       │   └── 🗂️ presentation/
│       ├── 🗂️ tests/
│       └── 🗂️ config/
│
├── 🗂️ kubernetes/
│   ├── 🗂️ namespaces/
│   │   ├── 📄 development.yaml
│   │   ├── 📄 staging.yaml
│   │   └── 📄 production.yaml
│   ├── 🗂️ microservices/
│   │   ├── 🗂️ iot-data-ingestion/
│   │   │   ├── 📄 deployment.yaml
│   │   │   ├── 📄 service.yaml
│   │   │   ├── 📄 configmap.yaml
│   │   │   └── 📄 hpa.yaml
│   │   ├── 🗂️ ml-prediction-engine/
│   │   │   ├── 📄 deployment.yaml
│   │   │   ├── 📄 service.yaml
│   │   │   └── 📄 configmap.yaml
│   │   └── 🗂️ analytics-dashboard/
│   │       ├── 📄 deployment.yaml
│   │       ├── 📄 service.yaml
│   │       └── 📄 ingress.yaml
│   ├── 🗂️ security/
│   │   ├── 📄 network-policies.yaml
│   │   ├── 📄 pod-security-policies.yaml
│   │   └── 📄 rbac.yaml
│   └── 🗂️ monitoring/
│       ├── 📄 serviceMonitor.yaml
│       └── 📄 prometheusRule.yaml
│
├── 🗂️ scripts/
│   ├── 📄 setup.sh
│   ├── 📄 deploy.sh
│   ├── 📄 backup.sh
│   └── 🗂️ ci-cd/
│       ├── 📄 jenkins-pipeline.groovy
│       ├── 📄 security-scan.sh
│       └── 📄 deploy-to-k8s.sh
│
├── 🗂️ docs/
│   ├── 📄 architecture.md
│   ├── 📄 security-guidelines.md
│   ├── 📄 deployment-guide.md
│   ├── 📄 api-documentation.md
│   └── 🗂️ diagrams/
│       ├── 📄 architecture-diagram.png
│       └── 📄 security-flow.png
│
└── 🗂️ monitoring/
    ├── 🗂️ grafana/
    │   ├── 🗂️ dashboards/
    │   │   ├── 📄 industrial-overview.json
    │   │   ├── 📄 security-monitoring.json
    │   │   └── 📄 ml-predictions.json
    │   └── 🗂️ provisioning/
    │       ├── 📄 datasources.yaml
    │       └── 📄 dashboards.yaml
    ├── 🗂️ prometheus/
    │   ├── 📄 prometheus.yml
    │   ├── 📄 alert-rules.yml
    │   └── 🗂️ targets/
    └── 🗂️ logs/
        ├── 📄 fluentd-config.yaml
        └── 📄 elasticsearch-config.yaml

```

🎯 Principais Melhorias Implementadas
-------------------------------------

### 1\. **Redução de Microserviços (5 serviços otimizados)**

-   **iot-data-ingestion**: Coleta e validação de dados IoT
-   **ml-prediction-engine**: Engine de ML para predições
-   **analytics-dashboard**: Dashboard web para visualização
-   **alert-notification**: Sistema de alertas e notificações
-   **equipment-management**: Gestão de equipamentos e manutenção

### 2\. **Infraestrutura como Código (Terraform)**

-   Módulos bem organizados por funcionalidade
-   Configuração completa do DevSecOps via Terraform
-   Dashboards e monitoramento provisionados automaticamente
-   Uso mínimo de YAML (apenas para Kubernetes)

### 3\. **Segurança Robusta**

-   Módulo dedicado de segurança
-   Configurações de WAF, Vault, IAM
-   Bastion host para acesso seguro
-   Network policies e RBAC para Kubernetes

### 4\. **Monitoramento Integrado**

-   Prometheus + Grafana configurados via Terraform
-   Dashboards específicos para indústria
-   Alertas automatizados
-   Logs centralizados com ELK Stack

### 5\. **DevSecOps Completo**

-   Pipeline CI/CD com Jenkins
-   Análise de qualidade com SonarQube
-   Scans de segurança com Trivy e OWASP ZAP
-   Container registry seguro

🚀 Próximos Passos
------------------

1.  **Configurar credenciais Oracle Cloud**
2.  **Implementar módulos Terraform**
3.  **Desenvolver microserviços principais**
4.  **Configurar pipeline CI/CD**
5.  **Implementar monitoramento e alertas**