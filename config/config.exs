import Config

config :logger, :console,
  metadata: [:request_id]

config :opentelemetry, :resource, service: %{name: "SOMETHING_TO_MEASURE"}

config :opentelemetry, :processors,
  otel_batch_processor: %{
    exporter: {
      :opentelemetry_exporter,
      %{endpoints: ["http://localhost:4318"]}
    }
  }
