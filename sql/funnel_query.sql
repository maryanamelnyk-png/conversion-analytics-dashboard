WITH
  sessions_info AS (
    SELECT
      user_pseudo_id,
      CAST(
        (
          SELECT value.int_value
          FROM UNNEST(event_params)
          WHERE key = 'ga_session_id'
        )
        AS STRING) AS session_id,
      CONCAT(
        user_pseudo_id,
        CAST(
          (
            SELECT value.int_value
            FROM UNNEST(event_params)
            WHERE key = 'ga_session_id'
          )
          AS STRING)) AS user_session_id,
      REGEXP_EXTRACT(
        (
          SELECT value.string_value
          FROM UNNEST(event_params)
          WHERE key = 'page_location'
        ),
        r'^https?://[^/]+(/[^?]*)') AS landing_page_location,
      geo.country AS country,
      device.category AS device_category,
      device.language AS device_language,
      device.operating_system AS operating_system,
      traffic_source.source AS source,
      traffic_source.medium AS medium,
      traffic_source.name AS campaign
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE event_name = 'session_start'
  ),
  events AS (
    SELECT
      CONCAT(
        user_pseudo_id,
        CAST(
          (
            SELECT value.int_value
            FROM UNNEST(event_params)
            WHERE key = 'ga_session_id'
          )
          AS STRING)) AS user_session_id,
      event_name,
      TIMESTAMP_MICROS(event_timestamp) AS event_timestamp
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE
      event_name IN (
        'session_start',
        'view_item',
        'add_to_cart',
        'begin_checkout',
        'add_shipping_info',
        'add_payment_info',
        'purchase')
  )
SELECT
  s.user_pseudo_id,
  s.session_id,
  s.user_session_id,
  s.landing_page_location,
  s.country,
  s.device_category,
  s.device_language,
  s.operating_system,
  s.source,
  s.medium,
  s.campaign,
  e.event_timestamp,
  e.event_name
FROM sessions_info s
LEFT JOIN events e
  USING (user_session_id);
