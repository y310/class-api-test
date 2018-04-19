class Types::Scalars::DateTime < Types::Scalars::BaseScalar
  description 'ISO8601フォーマットの日時データ'

  def self.coerce_input(input_value, context)
    begin
      Time.zone.parse(input_value)
    rescue
      raise GraphQL::CoercionError, "#{input_value.inspect} is not a valid DateTime"
    end
  end

  def self.coerce_result(ruby_value, context)
    ruby_value.iso8601
  end
end
