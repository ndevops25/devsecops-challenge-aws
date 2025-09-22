# devsecops-challenge-aws
Challenge Infraestructure develop with Terraform, provided in AWS cloud

🏭 Estrutura Otimizada - Sistema de Manutenção Preditiva Industrial
===================================================================

<img src="/docs/arquitecture/images/aws-oci-multicloud.png" alt="arquitecture">

Visao Geral:

📁 Estrutura Principal Otimizada
--------------------------------

```
devsecops-challenge-aws/
├── 📄 README.md                             # Documentação geral do projeto
├── 📄 .gitignore                            # Arquivos e pastas a serem ignorados pelo Git
├── 📄 docker-compose.yml                    # Para orquestração local de microserviços em desenvolvimento
├── 📄 Makefile                              # Comandos úteis para build, deploy, testes, etc.
├── 📄 LICENSE                               # Licença do projeto
├── 📄 .env.example                          # Exemplo de variáveis de ambiente
├── 📄 .github/                              # Configurações para GitHub Actions (CI/CD)
│   └── workflows/
│       ├── ci-cd-main.yml                   # Workflow CI/CD principal para todos os microserviços
│       ├── security-scan.yml                # Workflow dedicado para varreduras de segurança (SAST, DAST, etc.)
│       └── terraform-validate.yml           # Validação e plan review do Terraform
│
├── 🗂️ infrastructure/                       # Infraestrutura como Código (Terraform)
│   ├── 📄 main.tf                           # Configurações principais do Terraform
│   ├── 📄 variables.tf                      # Variáveis de entrada para o Terraform
│   ├── 📄 outputs.tf                        # Saídas de recursos criados pelo Terraform
│   ├── 📄 terraform.tfvars.example          # Exemplo de arquivo de variáveis de ambiente do Terraform
│   ├── 📄 provider.tf                       # Definição dos provedores Terraform (OCI, Grafana, etc.)
│   ├── 📄 versions.tf                       # Versões mínimas dos provedores e Terraform
│   └── 🗂️ modules/                          # Módulos Terraform reutilizáveis
│       ├── 🗂️ core-infrastructure/          # Módulo para infraestrutura de rede (VCNs, Subnets, Gateways)
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 vcn.tf
│       │   ├── 📄 subnets.tf
│       │   ├── 📄 security_groups.tf
│       │   ├── 📄 route_tables.tf
│       │   └── 📄 internet_gateway.tf
│       ├── 🗂️ security/                     # Módulo para recursos de segurança (IAM, Vault, WAF, Fortinet)
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 iam.tf                     # Configurações IAM da OCI
│       │   ├── 📄 vault.tf                   # OCI Vault para gerenciamento de segredos
│       │   ├── 📄 waf.tf                     # OCI WAF ou configurações para WAF de terceiros
│       │   ├── 📄 certificates.tf            # Gerenciamento de certificados TLS
│       │   ├── 📄 bastion.tf                 # Serviço OCI Bastion para acesso seguro
│       │   ├── 📄 fortinet_integration.tf    # Recursos Fortinet (ex: FortiWeb, FortiGate VMs)
│       │   └── 📄 network_security_groups.tf # Grupos de Segurança de Rede (NSGs) para K8s
│       ├── 🗂️ kubernetes/                   # Módulo para o cluster OKE (Oracle Container Engine for Kubernetes)
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 oke_cluster.tf
│       │   ├── 📄 node_pools.tf
│       │   ├── 📄 addons.tf                  # Addons do K8s (Ingress Controller, cert-manager)
│       │   └── 📄 rbac.tf                    # Configurações RBAC para o cluster
│       ├── 🗂️ storage/                      # Módulo para serviços de armazenamento (DB, Object Storage, Cache)
│       │   ├── 📄 main.tf
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 object_storage.tf          # OCI Object Storage
│       │   ├── 📄 autonomous_database.tf     # OCI Autonomous Database
│       │   ├── 📄 redis_cache.tf             # OCI Cache com Redis
│       │   └── 📄 backup_policies.tf         # Políticas de backup para recursos de armazenamento
│       ├── 🗂️ monitoring/                   # Módulo para monitoramento (Prometheus, Grafana, OCI Logging)
│       │   ├── 📄 main.tf                    # Contém a configuração do provedor Grafana e recursos
│       │   ├── 📄 variables.tf
│       │   ├── 📄 outputs.tf
│       │   ├── 📄 prometheus.tf              # Configuração do Prometheus (se provisionado via Terraform)
│       │   ├── 📄 grafana.tf                 # Configuração da instância Grafana (se provisionada via Terraform)
│       │   ├── 📄 grafana_datasources.tf     # Definição dos datasources do Grafana via Terraform
│       │   ├── 📄 grafana_folders.tf         # Definição das pastas do Grafana via Terraform
│       │   ├── 📄 grafana_dashboards.tf      # **Definição dos dashboards do Grafana via Terraform**
│       │   ├── 🗂️ grafana-dashboards/    # Arquivos JSON dos dashboards Grafana
│       │   │       ├── 📄 industrial-overview.json
│       │   │       ├── 📄 security-monitoring.json
│       │   │       ├── 📄 ml-predictions.json
│       │   │       └── 📄 microservice-health.json
│       │   ├── 📄 alertmanager.tf            # Configuração do Alertmanager
│       │   ├── 📄 oci_logging_analytics.tf   # OCI Logging Analytics para logs centralizados
│       │   └── 📄 dashboards.tf              # (Este arquivo pode ser removido ou re-nomeado se tudo for para grafana_dashboards.tf)
│       └── 🗂️ devsecops/                    # Módulo para ferramentas DevSecOps (Jenkins, SonarQube, Trivy, OWASP ZAP)
│           ├── 📄 main.tf
│           ├── 📄 variables.tf
│           ├── 📄 outputs.tf
│           ├── 📄 jenkins.tf                 # Instalação e configuração do Jenkins
│           ├── 📄 sonarqube.tf               # Instalação e configuração do SonarQube
│           ├── 📄 oci_container_registry.tf  # OCI Container Registry
│           ├── 📄 trivy.tf                   # (Configuração Trivy se auto-hospedado)
│           ├── 📄 owasp_zap.tf               # (Configuração OWASP ZAP se auto-hospedado)
│           └── 📄 ci_cd_pipeline_templates.tf# Templates para pipelines Jenkins (se Shared Libraries/Groovy)
│
├── 🗂️ microservices/
│   ├── 🗂️ iot-data-ingestion/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 requirements.txt
│   │   ├── 📄 main.py                      # Ponto de entrada da aplicação
│   │   ├── 📄 Jenkinsfile                  # Pipeline CI/CD específica
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/                  # Camada Core - Regras de Negócio e Entidades (Agregações)
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/            # Entidades do Domínio (Regras de Negócio) - S: Single Responsibility
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 sensor_data.py   # Dados brutos do sensor
│   │   │   │   │   ├── 📄 equipment.py     # Informações básicas do equipamento (ID, tipo)
│   │   │   │   │   └── 📄 telemetry.py     # Dados de telemetria processados/agregados
│   │   │   │   ├── 🗂️ value_objects/       # Objetos de Valor (imutáveis)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 timestamp.py
│   │   │   │   │   └── 📄 sensor_type.py
│   │   │   │   ├── 🗂️ exceptions/          # Exceções de Domínio
│   │   │   │   │   └── 📄 domain_exceptions.py
│   │   │   │   └── 🗂️ repositories/        # Interfaces/Abstrações de Repositórios (L: Liskov, D: Dependency Inversion)
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 sensor_data_repository_interface.py
│   │   │   │       └── 📄 telemetry_repository_interface.py
│   │   │   ├── 🗂️ application/             # Camada de Aplicação - Orquestra o Domínio, Casos de Uso
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ use_cases/           # Casos de Uso (Interactors) - S: Single Responsibility, O: Open/Closed
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 ingest_sensor_data.py       # Ex: Ingerir dados de um sensor específico
│   │   │   │   │   └── 📄 validate_and_enrich_telemetry.py # Ex: Validar e enriquecer telemetria antes de persistir
│   │   │   │   ├── 🗂️ dtos/                  # Data Transfer Objects (DTOs)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 sensor_data_dto.py
│   │   │   │   │   └── 📄 telemetry_dto.py
│   │   │   │   └── 🗂️ services/              # Serviços de Aplicação (se necessário) - Fachadas para casos de uso
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 data_ingestion_service.py # Ex: Uma fachada para os casos de uso de ingestão
│   │   │   ├── 🗂️ infrastructure/          # Camada de Infraestrutura - Detalhes de Implementação (D: Dependency Inversion)
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ persistence/           # Implementações de Repositórios (Acesso a Banco de Dados)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 oracle_sensor_repository_impl.py
│   │   │   │   │   └── 📄 oracle_telemetry_repository_impl.py
│   │   │   │   ├── 🗂️ messaging/             # Implementações de Clientes de Mensageria (Kafka, MQTT)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 kafka_producer_impl.py
│   │   │   │   │   └── 📄 mqtt_client_impl.py
│   │   │   │   ├── 🗂️ config/                # Configurações específicas da infraestrutura (conexões, etc.)
│   │   │   │   │   └── 📄 database_config.py
│   │   │   │   └── 🗂️ di/                    # Injeção de Dependência (DI) - Para conectar camadas
│   │   │   │       └── 📄 container.py
│   │   │   └── 🗂️ presentation/            # Camada de Apresentação - Entrada/Saída, APIs
│   │   │       ├── 📄 __init__.py
│   │   │       ├── 🗂️ api/                   # APIs REST (FastAPI, Flask)
│   │   │       │   ├── 📄 __init__.py
│   │   │       │   ├── 📄 routes.py          # Definição das rotas
│   │   │       │   ├── 📄 controllers/       # Controladores (adapta entrada para casos de uso)
│   │   │       │   │   └── 📄 ingestion_controller.py
│   │   │       │   └── 📄 dependencies.py    # Dependências para injeção nos endpoints (ex: use cases)
│   │   │       ├── 🗂️ cli/                   # Interfaces de Linha de Comando (se houver)
│   │   │       └── 🗂️ adapters/              # Adaptadores para frameworks/lib externos (se necessário)
│   │   │           └── 📄 fast_api_adapter.py
│   │   ├── 🗂️ tests/
│   │   │   ├── 🗂️ unit/
│   │   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 🗂️ application/
│   │   │   │   └── 🗂️ presentation/
│   │   │   ├── 🗂️ integration/
│   │   │   └── 🗂️ end_to_end/
│   │   └── 🗂️ config/                    # Configurações globais do microserviço
│   │       ├── 📄 settings.py
│   │       └── 📄 logger_config.py
│
│   ├── 🗂️ ml-prediction-engine/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 requirements.txt
│   │   ├── 📄 main.py
│   │   ├── 📄 Jenkinsfile
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 prediction.py        # Entidade de previsão (resultado do ML)
│   │   │   │   │   ├── 📄 ml_model.py          # Representação abstrata de um modelo ML
│   │   │   │   │   └── 📄 anomaly.py           # Representação de uma anomalia detectada
│   │   │   │   ├── 🗂️ value_objects/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 feature_vector.py    # Vetor de características para o modelo
│   │   │   │   ├── 🗂️ exceptions/
│   │   │   │   │   └── 📄 domain_exceptions.py
│   │   │   │   └── 🗂️ repositories/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 model_repository_interface.py
│   │   │   │       └── 📄 prediction_repository_interface.py
│   │   │   ├── 🗂️ application/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ use_cases/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 perform_prediction.py      # Executa a previsão com base nos dados de telemetria
│   │   │   │   │   ├── 📄 train_new_model.py         # Treina um novo modelo ML
│   │   │   │   │   └── 📄 detect_anomaly.py          # Detecta anomalias com base nas previsões
│   │   │   │   ├── 🗂️ dtos/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 prediction_request_dto.py
│   │   │   │   │   └── 📄 prediction_result_dto.py
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 ml_service.py              # Fachada para os casos de uso de ML
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ ml_frameworks/         # Implementações de frameworks ML (TensorFlow, Scikit-learn)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 tensorflow_model_impl.py
│   │   │   │   │   └── 📄 sklearn_model_impl.py
│   │   │   │   ├── 🗂️ persistence/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 oci_model_storage_impl.py  # Para carregar/salvar modelos na OCI Object Storage
│   │   │   │   │   └── 📄 oracle_prediction_repository_impl.py
│   │   │   │   ├── 🗂️ messaging/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 kafka_consumer_impl.py     # Para consumir dados de telemetria
│   │   │   │   └── 🗂️ di/
│   │   │   │       └── 📄 container.py
│   │   │   └── 🗂️ presentation/
│   │   │       ├── 📄 __init__.py
│   │   │       ├── 🗂️ api/
│   │   │       │   ├── 📄 __init__.py
│   │   │       │   ├── 📄 routes.py
│   │   │       │   ├── 📄 controllers/
│   │   │       │   │   └── 📄 prediction_controller.py
│   │   │       │   └── 📄 dependencies.py
│   │   │       └── 🗂️ cli/
│   │   │           └── 📄 model_training_cli.py
│   │   ├── 🗂️ models/                      # Modelos ML treinados (persistidos)
│   │   │   ├── 🗂️ trained/
│   │   │   └── 🗂️ experiments/
│   │   ├── 🗂️ tests/
│   │   │   ├── 🗂️ unit/
│   │   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 🗂️ application/
│   │   │   │   └── 🗂️ presentation/
│   │   │   ├── 🗂️ integration/
│   │   │   └── 🗂️ end_to_end/
│   │   └── 🗂️ config/
│   │       ├── 📄 settings.py
│   │       └── 📄 logger_config.py
│
│   ├── 🗂️ maintenance-scheduler/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 requirements.txt
│   │   ├── 📄 main.py
│   │   ├── 📄 Jenkinsfile
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 equipment.py         # Entidade detalhada do equipamento (ID, tipo, histórico, status)
│   │   │   │   │   ├── 📄 maintenance_schedule.py # Agendamento de manutenção
│   │   │   │   │   ├── 📄 work_order.py        # Ordem de serviço
│   │   │   │   │   └── 📄 maintenance_event.py # Evento relacionado à manutenção (falha, agendamento, conclusão)
│   │   │   │   ├── 🗂️ value_objects/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 equipment_status.py
│   │   │   │   ├── 🗂️ exceptions/
│   │   │   │   │   └── 📄 domain_exceptions.py
│   │   │   │   └── 🗂️ repositories/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 equipment_repository_interface.py
│   │   │   │       ├── 📄 maintenance_schedule_repository_interface.py
│   │   │   │       └── 📄 work_order_repository_interface.py
│   │   │   ├── 🗂️ application/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ use_cases/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 register_equipment.py
│   │   │   │   │   ├── 📄 get_equipment_status.py
│   │   │   │   │   ├── 📄 create_maintenance_schedule.py
│   │   │   │   │   ├── 📄 generate_work_order_from_prediction.py # Disparado por previsão de falha
│   │   │   │   │   └── 📄 update_work_order_status.py
│   │   │   │   ├── 🗂️ dtos/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 equipment_dto.py
│   │   │   │   │   └── 📄 work_order_dto.py
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 maintenance_management_service.py
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ persistence/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 oracle_equipment_repository_impl.py
│   │   │   │   │   └── 📄 oracle_work_order_repository_impl.py
│   │   │   │   ├── 🗂️ messaging/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 kafka_consumer_impl.py     # Para consumir previsões de falha do ML Engine
│   │   │   │   │   └── 📄 kafka_producer_impl.py     # Para enviar eventos para Alerts & Dashboard
│   │   │   │   └── 🗂️ di/
│   │   │   │       └── 📄 container.py
│   │   │   └── 🗂️ presentation/
│   │   │       ├── 📄 __init__.py
│   │   │       ├── 🗂️ api/
│   │   │       │   ├── 📄 __init__.py
│   │   │       │   ├── 📄 routes.py
│   │   │       │   ├── 📄 controllers/
│   │   │       │   │   └── 📄 equipment_controller.py
│   │   │       │   └── 📄 dependencies.py
│   │   │       └── 🗂️ internal_api/          # API para comunicação entre microsserviços (se necessário)
│   │   │           └── 📄 prediction_callback_controller.py # Endpoint para ML Engine notificar
│   │   ├── 🗂️ tests/
│   │   │   ├── 🗂️ unit/
│   │   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 🗂️ application/
│   │   │   │   └── 🗂️ presentation/
│   │   │   ├── 🗂️ integration/
│   │   │   └── 🗂️ end_to_end/
│   │   └── 🗂️ config/
│   │       ├── 📄 settings.py
│   │       └── 📄 logger_config.py
│
│   └── 🗂️ alerts-and-dashboard/
│   │   ├── 📄 Dockerfile
│   │   ├── 📄 package.json                 # Ou requirements.txt se Python para backend
│   │   ├── 📄 server.js                    # Ou main.py se Python para backend
│   │   ├── 📄 Jenkinsfile
│   │   ├── 🗂️ src/
│   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ entities/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 alert.py             # Alerta gerado (com criticidade, mensagem)
│   │   │   │   │   ├── 📄 notification.py      # Notificação enviada (com canal, status)
│   │   │   │   │   └── 📄 kpi.py               # Indicador Chave de Desempenho para o dashboard
│   │   │   │   ├── 🗂️ value_objects/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 notification_channel.py
│   │   │   │   ├── 🗂️ exceptions/
│   │   │   │   │   └── 📄 domain_exceptions.py
│   │   │   │   └── 🗂️ repositories/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       ├── 📄 alert_repository_interface.py
│   │   │   │       └── 📄 kpi_repository_interface.py
│   │   │   ├── 🗂️ application/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ use_cases/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 process_incoming_alert.py    # Recebe e processa um alerta (do Maintenance Scheduler)
│   │   │   │   │   ├── 📄 send_notification.py         # Envia notificação por e-mail/Slack
│   │   │   │   │   ├── 📄 get_dashboard_data.py        # Coleta dados para o dashboard
│   │   │   │   │   └── 📄 track_notification_status.py
│   │   │   │   ├── 🗂️ dtos/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 alert_event_dto.py
│   │   │   │   │   └── 📄 dashboard_data_dto.py
│   │   │   │   └── 🗂️ services/
│   │   │   │       ├── 📄 __init__.py
│   │   │   │       └── 📄 notification_service.py
│   │   │   ├── 🗂️ infrastructure/
│   │   │   │   ├── 📄 __init__.py
│   │   │   │   ├── 🗂️ persistence/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 oracle_alert_repository_impl.py
│   │   │   │   ├── 🗂️ messaging/
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 kafka_consumer_impl.py     # Para consumir eventos de alerta
│   │   │   │   ├── 🗂️ providers/             # Implementações de serviços externos (e-mail, Slack)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   ├── 📄 email_provider_impl.py
│   │   │   │   │   └── 📄 slack_provider_impl.py
│   │   │   │   ├── 🗂️ cache/                 # Implementação de cache (Redis)
│   │   │   │   │   ├── 📄 __init__.py
│   │   │   │   │   └── 📄 redis_cache_impl.py
│   │   │   │   └── 🗂️ di/
│   │   │   │       └── 📄 container.py
│   │   │   └── 🗂️ presentation/
│   │   │       ├── 📄 __init__.py
│   │   │       ├── 🗂️ api/
│   │   │       │   ├── 📄 __init__.py
│   │   │       │   ├── 📄 routes.py
│   │   │       │   ├── 📄 controllers/
│   │   │       │   │   ├── 📄 alert_controller.py
│   │   │       │   │   └── 📄 dashboard_controller.py
│   │   │       │   └── 📄 dependencies.py
│   │   │       └── 🗂️ web/                   # Frontend do Dashboard (React, Angular, Vue, ou HTML/JS puro)
│   │   │           ├── 📄 index.html
│   │   │           ├── 📄 dashboard.js
│   │   │           ├── 📄 real-time.js
│   │   │           └── 🗂️ assets/
│   │   ├── 🗂️ tests/
│   │   │   ├── 🗂️ unit/
│   │   │   │   ├── 🗂️ domain/
│   │   │   │   ├── 🗂️ application/
│   │   │   │   └── 🗂️ presentation/
│   │   │   ├── 🗂️ integration/
│   │   │   └── 🗂️ end_to_end/
│   │   └── 🗂️ config/
│   │       ├── 📄 settings.py
│   │       └── 📄 logger_config.py
│
├── 🗂️ kubernetes/                           # Manifestos Kubernetes (Deployment, Service, Ingress, etc.)
│   ├── 🗂️ namespaces/                       # Definição de namespaces por ambiente
│   │   ├── 📄 development.yaml
│   │   ├── 📄 staging.yaml
│   │   └── 📄 production.yaml
│   ├── 🗂️ microservices/                    # Manifestos K8s para cada microserviço
│   │   ├── 🗂️ iot-data-ingestion/
│   │   │   ├── 📄 deployment.yaml
│   │   │   ├── 📄 service.yaml
│   │   │   ├── 📄 configmap.yaml
│   │   │   ├── 📄 hpa.yaml
│   │   │   └── 📄 networkpolicy.yaml         # Políticas de rede para isolamento
│   │   ├── 🗂️ ml-prediction-engine/
│   │   │   ├── 📄 deployment.yaml
│   │   │   ├── 📄 service.yaml
│   │   │   ├── 📄 configmap.yaml
│   │   │   └── 📄 networkpolicy.yaml
│   │   ├── 🗂️ maintenance-scheduler/
│   │   │   ├── 📄 deployment.yaml
│   │   │   ├── 📄 service.yaml
│   │   │   ├── 📄 configmap.yaml
│   │   │   └── 📄 networkpolicy.yaml
│   │   └── 🗂️ alerts-and-dashboard/
│   │       ├── 📄 deployment.yaml
│   │       ├── 📄 service.yaml
│   │       ├── 📄 ingress.yaml
│   │       ├── 📄 configmap.yaml
│   │       └── 📄 networkpolicy.yaml
│   ├── 🗂️ security/                         # Políticas de segurança globais do K8s
│   │   ├── 📄 pod-security-admission.yaml    # Ou Pod Security Standards
│   │   ├── 📄 rbac.yaml                      # Roles e RoleBindings para K8s
│   │   └── 📄 secrets.yaml                   # Exemplo de como gerenciar secrets (preferencialmente OCI Vault/External Secrets)
│   └── 🗂️ monitoring/                       # Configurações de monitoramento no K8s
│       ├── 📄 serviceMonitor.yaml            # Para Prometheus operator
│       ├── 📄 prometheusRule.yaml            # Regras de alerta do Prometheus
│       └── 📄 grafana-dashboard-configmap.yaml # (Pode ser removido se todos os dashboards forem Terraform)
│
├── 🗂️ scripts/                              # Scripts auxiliares para setup, deploy, etc.
│   ├── 📄 setup.sh
│   ├── 📄 deploy.sh
│   ├── 📄 backup.sh
│   └── 🗂️ ci-cd/
│       ├── 📄 jenkins-shared-library/        # Biblioteca Jenkins compartilhada para lógica de pipeline reutilizável
│       │   ├── 🗂️ vars/                      # Funções globais da biblioteca
│       │   │   ├── 📄 buildDockerImage.groovy
│       │   │   ├── 📄 runSonarScan.groovy
│       │   │   ├── 📄 runTrivyScan.groovy
│       │   │   ├── 📄 runOwaspZapScan.groovy
│       │   │   ├── 📄 deployToK8s.groovy
│       │   │   └── 📄 notifySlack.groovy
│       │   └── 🗂️ src/
│       │       └── 🗂️ com/
│       │           └── 🗂️ yourproject/
│       │               └── 📄 Utils.groovy
│       └── 📄 security-audit.sh              # Script para orquestrar varreduras de segurança
│
├── 🗂️ docs/                                 # Documentação do projeto
│   ├── 📄 architecture.md
│   ├── 📄 security-guidelines.md
│   ├── 📄 deployment-guide.md
│   ├── 📄 api-documentation.md
│   ├── 📄 fortinet-integration.md            # Documentação específica sobre a integração Fortinet
│   └── 🗂️ diagrams/
│       ├── 📄 architecture-diagram.png
│       └── 📄 security-flow.png
│
└── 🗂️ monitoring/                           # Configurações de ferramentas de monitoramento (fora do K8s)
    ├── 🗂️ grafana/                          # (Esta pasta pode ser quase vazia se tudo for Terraform)
    │   ├── 🗂️ dashboards/                   # Pode conter dashboards temporários ou para backup manual
    │   └── 🗂️ provisioning/                 # Pode conter configs de provisionamento Legado ou para testes
    ├── 🗂️ prometheus/
    │   ├── 📄 prometheus.yml
    │   ├── 📄 alert-rules.yml
    │   └── 🗂️ targets/
    └── 🗂️ logs/
        ├── 📄 fluentd-config.yaml
        ├── 📄 oci-logging-analytics-agent-config.yaml # Configuração para agente de logs da OCI
        └── 📄 log-processing-rules.yaml      # Regras de processamento de logs

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



Claude, você pode gerar um xml somente com essas conexões, mostrando a separação das clouds e as suas conexões por meio dos tópicos e do cross-cloud-sync-topic, por favor ?