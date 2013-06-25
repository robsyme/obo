require 'helper'
require "pp"

class TestObo < MiniTest::Unit::TestCase
  def setup
    @obo = Obo::Parser.new('test/data/ro.obo')
  end

  def test_header_parsing
    header = @obo.elements.first
    assert_equal Obo::Header, header.class
    assert_equal '1.2', header['format-version']
    assert_equal 'cjm', header['saved-by']
    assert_equal 3, header['remark'].length
  end

  def test_stanza_parsing
    first_stanza = @obo.elements.find{|element| element.is_a? Obo::Stanza}

    assert_equal 'Typedef', first_stanza.name
    assert_equal 'OBO_REL:is_a', first_stanza['id']
    assert_equal 'is_a', first_stanza['name']
    assert first_stanza['is_reflexive']
  end

  def test_fancy_methods
    first_stanza = @obo.elements.find{|element| element.is_a? Obo::Stanza}
    assert_equal 'OBO_REL:is_a', first_stanza.id
    assert first_stanza.is_reflexive
    assert first_stanza.is_reflexive?

    assert_raises(NoMethodError){first_stanza.is_a_zebra?}
  end

  def test_readthrough
    assert_equal 27, @obo.elements.count
  end

  def test_term_extraction
    typedefs = []

    @obo.elements.each do |elm|
      typedefs << elm
    end

    assert_equal 26, typedefs.select { |e| e.class == Obo::Stanza && e.name == "Typedef" }.size
  end

  def test_rewind
    # Run through the file to the end
    @obo.elements.count
    assert_equal 27, @obo.elements.count
  end
end


