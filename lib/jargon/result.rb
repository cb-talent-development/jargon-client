module Jargon
  class Result
    attr_reader :raw_headers, :contents, :total_items, :page, :per_page, :errors, :range_start, :range_end, :range, :status

    def initialize(body, headers, status)
      @contents = body.deep_symbolize_keys
      @raw_headers = headers
      @status = status
      @total_items = headers['x-total-items'] unless headers['x-total-items'].nil?
      parse_headers(headers)
      @errors = find_errors
    end

    def is_error?
      @status >= 400 || (@contents.is_a?(Hash) && @contents.has_key?('errors'))
    end

    private

    def parse_headers(headers)
      if headers['x-total-items']
        @count = headers['x-total-items']
      end
      if headers['content-range']
        matches = headers['content-range'].match(/^(\w+) (\d+)\-(\d+):(\d+)\/\d+$/i)
        @per_page = matches[4].to_i
        @range_start = matches[2].to_i
        @range_end = matches[3].to_i
        @range = "#{@range_start}-#{@range_end}"
        @page = (@range_end / @per_page) + 1
      end
    end

    def find_errors
      if is_error?
        if @contents.is_a?(Hash)
          if @contents.has_key?('errors')
            Array(@contents['errors'])
          else
            Array(@contents['message'])
          end
        else
          Array(@contents)
        end
      else
        Array(nil)
      end
    end

    # deep_symbolize_keys and support methods from Rails

    def deep_symbolize_keys
      deep_transform_keys{ |key| key.to_sym rescue key }
    end

    def deep_transform_keys(&block)
      _deep_transform_keys_in_object(self, &block)
    end

    def _deep_transform_keys_in_object(object, &block)
      case object
        when Hash
          object.each_with_object({}) do |(key, value), result|
            result[yield(key)] = _deep_transform_keys_in_object(value, &block)
          end
        when Array
          object.map {|e| _deep_transform_keys_in_object(e, &block) }
        else
          object
      end
    end
  end
end